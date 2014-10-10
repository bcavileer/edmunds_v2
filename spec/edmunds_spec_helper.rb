require 'rspec'
require 'shared/core_context'
require 'shared/default_spec_context'
require 'shared/state_spec_context'
require 'shared/view_spec_context'
require 'shared/year_spec_context'
require 'shared/submodel_spec_context'
require 'shared/category_spec_context'
require 'shared/availability_spec_context'
require 'shared/name_spec_context'

require 'dotenv'
Dotenv.load

unless ENV['VCR_OFF']
  require 'vcr'

  VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/vcr_cassettes'
    c.hook_into :webmock
    c.filter_sensitive_data('EDMUNDS_API_KEY') { ENV['EDMUNDS_API_KEY'] }
    c.ignore_hosts 'codeclimate.com'

    # filter sensitive response headers from API
    c.before_record do |i|
      i.response.headers.delete('Set-Cookie')
      i.response.headers.delete('X-Session')
    end

    # default quota of 2 API calls/second and 5000 API calls/day.
    # rate limit when really hitting server
    c.after_http_request(:real?)  do |request, response|
      sanitized_uri = request.uri.sub(ENV['EDMUNDS_API_KEY'], 'EDMUNDS_API_KEY')
      $stderr.puts "saving vcr cassette: cassette file missing for #{sanitized_uri}"
      sleep(1)
    end
  end
end
