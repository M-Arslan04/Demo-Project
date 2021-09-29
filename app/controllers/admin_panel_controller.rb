class AdminPanelController < ApplicationController
  before_action :redirect_to_leads, only: :index

  def index
    @users = User.all
  end

  private

  def redirect_to_leads
    redirect_to leads_path unless current_user.has_role? :admin
  end
end
