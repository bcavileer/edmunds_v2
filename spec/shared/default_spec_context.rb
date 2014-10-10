RSpec.shared_context 'default_spec' do
  subject { call_api }

  specify 'default' do
    expect(parameters).to include(fmt: 'json')
  end
end
