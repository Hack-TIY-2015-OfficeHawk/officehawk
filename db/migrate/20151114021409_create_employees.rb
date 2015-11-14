class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :password, null: false
      t.string :organization, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
