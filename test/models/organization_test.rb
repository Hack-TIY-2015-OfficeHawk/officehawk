require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create valid organization" do
    organization = Organization.new(name: "ORG",
                                    owner: "Terri")

    assert organization.save

    assert organization.errors.blank?
  end

  test "cannot create org with blank name" do
    organization = Organization.new(owner: "Terri")

    refute organization.save

    assert organization.errors.present?
  end

  test "cannot create org with blank owner" do
    organization = Organization.new(name: "ORG")

    refute organization.save

    assert organization.errors.present?
  end

  test "cannot create two orgs with same name" do
    organization1 = Organization.new(name: "ORG",
                                    owner: "Terri")

    organization2 = Organization.new(name: "ORG",
                                     owner: "Terri")

    assert organization1.save
    refute organization2.save

    assert organization1.errors.blank?
    assert organization2.errors.present?
  end
end
