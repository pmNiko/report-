class DreportPolicy < ApplicationPolicy

  def index
    user.present?
  end

  def close
    user.has_role? :technician
  end

  def end_shift
    user.has_role? :technician
  end

  def show
    user.present?
  end

  def current
    user.present?
  end

end
