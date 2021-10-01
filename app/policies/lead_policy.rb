class LeadPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_is_authorized?
  end

  def new?
    user_is_authorized?
  end

  def update?
    user_is_authorized?
  end

  def edit?
    user_is_authorized?
  end

  private

  def user_is_authorized?
    @user.roles.first.name == 'admin' || @user.roles.first.name == 'business_developer'
  end
end
