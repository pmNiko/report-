# app/helpers/roles_helper.rb
module RolesHelper
  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

  def has_roles?(role_1, role_2)
    current_user &&
    (current_user.has_role?(role_1) || current_user.has_role?(role_2))
  end
end
