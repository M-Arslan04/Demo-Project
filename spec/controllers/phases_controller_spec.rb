require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe PhasesController, type: :controller do
  describe 'GET #index' do
    before do
      user = create(:user)
      sign_in user
    end
    byebug
    context 'should redirect' do
     let(:lead) {create(:lead)}
     let(:phases) { get :index }

      it 'to index page' do
        get :index

        expect(response.status).to eq(200)
      end
    end
  end
end
