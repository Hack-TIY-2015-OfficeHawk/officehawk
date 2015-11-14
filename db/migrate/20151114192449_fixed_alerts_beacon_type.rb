class FixedAlertsBeaconType < ActiveRecord::Migration
  def change
    remove_column :alerts, :beacon_id
    add_column :alerts, :beacon_id, :integer, null: false
  end
end
