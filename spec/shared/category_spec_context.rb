RSpec.shared_context 'category_spec' do
  describe 'category' do
    subject { call_api category: 'Sedan' }

    it 'Sedan' do
      expect(parameters).to include(category: 'Sedan', view: 'basic', fmt: 'json')
    end
  end
end
