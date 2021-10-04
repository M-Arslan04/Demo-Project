class PhasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_can_create?
  end

  def new?
    user_can_create?
  end

  def update?
    user_can_update?
  end

  def edit?
    user_can_update?
  end

  def destroy?
    false
  end

  private

  def user_can_create?
    @user.roles.first.name == 'admin' || @user.roles.first.name == 'business_developer'
  end

  def user_can_update?
    @user.roles.first.name == 'admin' || @user.roles.first.name == 'business_developer' || @user.roles.first.name == 'manager'
  end
end
