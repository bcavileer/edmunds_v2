RSpec.shared_context 'view_spec' do
  describe 'view' do
    subject { call_api view: 'full' }

    specify 'full' do
      expect(parameters).to include(view: 'full', fmt: 'json')
    end
  end
end
