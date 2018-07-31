class ClaimPolicy < ApplicationPolicy

  def history?
    user.present?
  end

  def begin?
    user.present?
  end

  def coordinate?
    user.present?
  end

  def show?
    user.present?
  end

  def new?
    user.has_role? :dir
  end

  def edit?
    user.has_role? :technician
  end

  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.has_role? :dir
  end

end
