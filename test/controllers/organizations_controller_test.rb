require 'test_helper'

class OrganizationsControllerTest  < ActionController::TestCase

  test "new organizations can register" do
      assert_difference "Organization.count" do
        post :create, { name: "TestORG", username: "Test User One", password: "TestPassword" }
      end

      assert_response :created
      assert_not_nil assigns(:organization)

      assert_difference "Employee.count" do
        post :create, { name: "TestORG 2", username: "Test User One", password: "TestPassword" }
      end

      assert_response :created
      assert_not_nil assigns(:owner)
  end

  test "non logged in users can get all organizations" do
    get :index

    assert_response :ok

    assert_not_nil assigns(:organizations)
  end

  test "logged in users can update organization" do
    @request.headers["auth-token"] = employees(:one).auth_token

    put :update, { id: organizations(:one).id, organization: { name: "New Name", owner: "New Owner" } }
    assert_response :ok

    assert_not_nil assigns(:organization)
  end

  test "non logged in users cannot update organization" do
    put :update, { id: organizations(:one).id, organization: { name: "New Name", owner: "New Owner" } }

    assert_response :unauthorized
  end

  test "logged in users can delete organization" do
    @request.headers["auth-token"] = employees(:one).auth_token

    assert_difference "Organization.count", -1 do
      delete :destroy, { id: organizations(:one).id }
    end

    assert_response :ok

  end

  test "deleting an organization deletes associated employees" do
    @request.headers["auth-token"] = employees(:one).auth_token

    assert_difference "Employee.count", -1 do
      delete :destroy, { id: organizations(:one).id }
    end

    assert_response :ok
  end

  test "deleting an organization deletes associated beacons" do
    @request.headers["auth-token"] = employees(:one).auth_token

    assert_difference "Beacon.count", -1 do
      delete :destroy, { id: organizations(:one).id }
    end

    assert_response :ok
  end

  test "non logged in users cannot delete organization" do

    assert_no_difference "Organization.count" do
      delete :destroy, { id: organizations(:one).id }
    end

    assert_response :unauthorized
  end
end