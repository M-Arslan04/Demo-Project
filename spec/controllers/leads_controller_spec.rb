require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe LeadsController, type: :controller do
    describe 'GET #index' do
      before do
        user = create(:user)
        sign_in user
      end

      context 'should redirect' do
        let(:leads) { get :index }

        it 'to index page' do
          get :index

          expect(response.status).to eq(200)
        end
      end
    end

    describe 'Lead #Create'
      context 'creates a lead' do

        it 'should be a valid lead' do
          lead = create(:lead)

          expect(lead).to be_valid
        end
      end
end
