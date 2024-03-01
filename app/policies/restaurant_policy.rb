class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def new?
    create?
  end

  def create?
    return true
  end

  def edit?
    update?
  end

  def update?
    # Flat.find(1).user_id = current_user.id
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
