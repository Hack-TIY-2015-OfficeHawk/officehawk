class AddAuthTokenToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :auth_token, :string, null: false
  end
end
