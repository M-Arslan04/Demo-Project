class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def index
    # @users = User.all
  end

  def edit
    @roles = {}
    Role.all.collect do |r|
      @roles[r.name] = r.id if r.name != 'admin'
    end
  end

  def update
    @user.roles = []
    @new_role = Role.find(user_params[:role_ids].to_i)
    @user.add_role(@new_role.name)
    @user.touch
    redirect_to admin_panel_index_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role_ids)
  end
end
