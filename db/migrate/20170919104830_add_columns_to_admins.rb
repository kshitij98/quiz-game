class AddColumnsToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :first_name, :string, :default => nil
    add_column :admins, :last_name, :string, :default => nil
  end
end
