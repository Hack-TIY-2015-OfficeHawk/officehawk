require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can create valid employee" do
    employee = organizations(:one).employees.new(username: "Foo",
                                                 password: "Bar")

    assert employee.save

    assert employee.errors.blank?
  end

  test "cannot create employee with blank username" do
    employee = organizations(:one).employees.new(password: "Bar")

    refute employee.save

    assert employee.errors.present?
  end

  test "cannot create employee with blank password" do
    employee = organizations(:one).employees.new(username: "Foo")

    refute employee.save

    assert employee.errors.present?
  end

  test "cannot create employee with blank org id" do
    employee = Employee.new(username: "Foo", password: "Bar")

    refute employee.save

    assert employee.errors.present?
  end

  test "cannot create two employees with same username in same org" do
    employee1 = organizations(:one).employees.new(username: "Foo", password: "Bar")
    employee2 = organizations(:one).employees.new(username: "Foo", password: "Bar")

    assert employee1.save
    refute employee2.save

    assert employee1.errors.blank?
    assert employee2.errors.present?
  end
end
