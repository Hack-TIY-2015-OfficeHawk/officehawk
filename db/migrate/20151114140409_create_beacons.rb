class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :name
      t.string :uuid

      t.timestamps null: false
    end
  end
end
