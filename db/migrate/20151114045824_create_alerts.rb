class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :beacon_id, null: false
      t.string :state, null: false
      t.integer :duration, null: false
      t.integer :employee_id, null: false

      t.timestamps null: false
    end
  end
end
