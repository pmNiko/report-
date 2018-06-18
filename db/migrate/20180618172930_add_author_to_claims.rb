class AddAuthorToClaims < ActiveRecord::Migration[5.2]
  def change
    add_reference :claims, :author, index: true
  end
end
