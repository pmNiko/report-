class TeamPolicy < ApplicationPolicy

  def home_technician?
    user.has_role? :technician
  end

  def home_dir?
    user.has_role? :dir
  end

  def home?
    user.present?
  end

  def daily_report?
    user.present?
  end

  def index?
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
