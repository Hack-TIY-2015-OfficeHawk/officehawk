class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :organization_id, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end

    add_index :employees, [:organization, :username], unique: true
  end
end
