require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe LeadsController, type: :controller do
  before do
        @user = create(:user, :business_developer)
        sign_in @user
  end
  describe 'Lead contoller' do

    context 'index call should redirect' do
      let(:leads) { get :index }

      it 'to index page' do
        get :index

        expect(response.status).to eq(200)
      end
    end

    context 'on new call' do
      it 'should redirect to new form' do

        get :new
        expect redirect_to(new_lead_path)
      end
    end

    # let(:lead) { create(:lead) }
    context 'on create call' do
     let(:valid_params) {attributes_for(:lead)}
     let(:create_lead) {post :create, params: {lead: valid_params}}
      it 'should create a lead' do
        # byebug
        expect{create_lead}.to change(Lead, :count).by(1)
      end

     let(:invalid_params) {attributes_for(:lead, title: nil)}
     let(:create_lead) {post :create, params: {lead: invalid_params}}
      it 'should not create a lead' do
        # byebug
        expect render_template(:new)
      end
    end
  end
end
