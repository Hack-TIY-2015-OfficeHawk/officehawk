class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :beacon, null: false
      t.string :state
      t.integer :duration
      t.integer :employee_id, null: false

      t.timestamps null: false
    end
  end
end
