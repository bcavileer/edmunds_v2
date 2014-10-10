RSpec.shared_context 'name_spec' do
  describe 'name' do
    subject { call_api name: name }

    it 'name' do
      expect(parameters).to include(name: name, fmt: 'json')
    end
  end
end
