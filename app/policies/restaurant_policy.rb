class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    #Only an owner
    record.user == user
  end

  def create?
    #Any logged in user can create
    !user.nil?
  end

  def destroy?
    update?
  end
end
