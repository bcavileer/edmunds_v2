require 'fileutils'
require 'yaml'

RSpec.shared_context 'core_context' do
  include described_class

  let(:args)       {[]}
  let(:parameters) { subject.edmunds_request.parameters }
  let(:endpoint)   { subject.edmunds_request.endpoint }

  def call_api(params={})
    send meth, *args, params
  end

  after(:each) do
    expect(parameters).to include('api_key')
    expect(endpoint).to eq(Edmunds::Api.base_uri + expected_path)
  end

  after(:each) do
    if ENV['VCR_OFF']
      compare_result_to_fixture

      # default quota of 2 API calls/second and 5000 API calls/day.
      # rate limit when really hitting server
      sleep(1)
    else
      VCR.use_cassette(vcr_cassette) do
        compare_result_to_fixture
      end
    end
  end

  def compare_result_to_fixture
    expect(subject).to eq(example_fixture)
  end

  let(:vcr_cassette) do
    klass_name = described_class.name.underscore
    params = parameters.except('api_key').map { |k, v| "#{CGI::escape(k)}_#{CGI::escape(v)}" }.join("-")
    "#{klass_name}/#{meth.parameterize}-#{params}"
  end

  let(:example_fixture) do |example|
    path = fixture_file_path(example)
    if File.exist? path
      load_fixture path
    else
      save_fixture path
    end
  end

  def fixture_file_path(example)
    'fixtures/expected/' + example_to_path(example) + '.yml'
  end

  def example_to_path(example)
    example.metadata[:full_description].underscore.gsub('#', '/').gsub(' ', '-')
  end

  def load_fixture(path)
    YAML.load_file path
  end

  def save_fixture(path)
    $stderr.puts "saving fixture: fixture file missing for #{path}"

    dirname = File.dirname(path)

    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end

    File.open(path, 'w') { |file| file.write(YAML.dump(subject)) }
    subject
  end
end
