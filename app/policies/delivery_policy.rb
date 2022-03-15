class DeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user || user.admin)
    end

    def show?
      record.user = user.admin || record.user_id
    end

    def update?
      record.user = user.admin
    end
  end
end
