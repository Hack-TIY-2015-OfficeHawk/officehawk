class AddMajorMinorColumnsToBeacon < ActiveRecord::Migration
  def change
    add_column :beacons, :major, :string, null: false
    add_column :beacons, :minor, :string, null: false
    add_column :beacons, :organization_id, :integer, null: false
    remove_column :beacons, :name
  end
end
