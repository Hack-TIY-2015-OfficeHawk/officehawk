require 'test_helper'

class BeaconTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create valid beacon" do
    beacon = organizations(:one).beacons.new(uuid: "testuuid",
                                             major: "100",
                                             minor: "1001")

    assert beacon.save

    assert beacon.errors.blank?
  end

  test "cannot create beacon with blank uuid" do
    beacon = organizations(:one).beacons.new(major: "100",
                                             minor: "1001")

    refute beacon.save

    assert beacon.errors.present?
  end

  test "cannot create beacon with blank major" do
    beacon = organizations(:one).beacons.new(uuid: "testuuid",
                                             minor: "1001")

    refute beacon.save

    assert beacon.errors.present?
  end


  test "cannot create beacon with blank minor" do
    beacon = organizations(:one).beacons.new(uuid: "testuuid",
                                             major: "1001")

    refute beacon.save

    assert beacon.errors.present?
  end


end
