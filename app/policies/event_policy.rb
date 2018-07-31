class EventPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def new?
    user.has_role? :dir
  end

  def edit?
    user.has_role? :dir
  end

  def create?
    user.has_role? :dir
  end

  def update?
    user.has_role? :dir
  end

  def destroy?
    user.has_role? :dir
  end

end
