RSpec.shared_context 'submodel_spec' do
  describe 'submodel' do
    subject { call_api submodel: '3-series' }

    it '3-series' do
      expect(parameters).to include(submodel: '3-series', fmt: 'json')
    end
  end
end
