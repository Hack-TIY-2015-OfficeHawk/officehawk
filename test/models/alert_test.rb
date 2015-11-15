require 'test_helper'

class AlertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create valid alert" do
    alert = employees(:one).alerts.new(beacon_id: beacons(:one).id,
                                       state: "near",
                                       duration: 15)

    assert alert.save

    assert alert.errors.blank?
  end

  test "cannot create alert with blank state" do
    alert = employees(:one).alerts.new(beacon_id: beacons(:one).id,
                                       duration: 15)

    refute alert.save

    assert alert.errors.present?
  end

  test "cannot create alert with blank duration" do
    alert = employees(:one).alerts.new(beacon_id: beacons(:one).id,
                                       state: "near")

    refute alert.save

    assert alert.errors.present?
  end

  test "cannot create alert with blank beacon id" do
    alert = employees(:one).alerts.new(duration: 15,
                                       state: "near")

    refute alert.save

    assert alert.errors.present?
  end

  test "cannot create alert with blank employee id" do
    alert = Alert.new(duration: 15,
                      state: "near",
                      beacon_id: beacons(:one).id) 

    refute alert.save

    assert alert.errors.present?
  end
end
