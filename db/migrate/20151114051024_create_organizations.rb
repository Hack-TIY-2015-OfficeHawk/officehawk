class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :owner, null: false

      t.timestamps null: false
    end
  end
end
