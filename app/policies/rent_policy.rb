class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def destroy?
    true
  end
  
  def my_rents?
    true
  end
  
end
