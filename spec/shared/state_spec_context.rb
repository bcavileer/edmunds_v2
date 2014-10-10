RSpec.shared_context 'state_spec' do
  describe 'state' do
    subject { call_api state: 'new' }

    specify 'new' do
      expect(parameters).to include(state: 'new', fmt: 'json')
    end
  end
end
