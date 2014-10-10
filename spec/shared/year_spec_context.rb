RSpec.shared_context 'year_spec' do
  describe 'year' do
    subject { call_api year: '1990' }

    specify '1990' do
      expect(parameters).to include(year: '1990', fmt: 'json')
    end
  end
end
