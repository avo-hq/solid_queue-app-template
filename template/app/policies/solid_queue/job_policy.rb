class SolidQueue::JobPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def destroy?
    true
  end

  def create_failed_execution?
    false
  end

  def attach_failed_execution?
    false
  end

  def destroy_failed_execution?
    false
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
