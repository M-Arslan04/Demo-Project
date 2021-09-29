class AdminPanelController < ApplicationController
  def index
    redirect_to leads_path unless current_user.has_role? :admin
    @users = User.all
  end
end
