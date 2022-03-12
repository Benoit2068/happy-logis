class LoadingPolicy < ApplicationPolicy
  class Scope < Scope
    scope.where(user.admin)
  end

  def show?
    record.user = user.admin || record.user_id
  end

  def create?
    record.user = user.admin
  end

  def update?
    record.user = user.admin
  end

  def destroy?
    record.user = user.admin
  end
end
