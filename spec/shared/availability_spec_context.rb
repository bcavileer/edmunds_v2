RSpec.shared_context 'availability_spec' do
  describe 'availability' do
    subject { call_api availability: 'standard' }

    it 'standard' do
      expect(parameters).to include(availability: 'standard', fmt: 'json')
    end
  end
end
