require 'test_helper'

class ProjectMembershipsControllerTest < ActionController::TestCase
  setup do
    @project_membership = project_memberships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_memberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_membership" do
    assert_difference('ProjectMembership.count') do
      post :create, project_membership: { joined: @project_membership.joined, leaved: @project_membership.leaved }
    end

    assert_redirected_to project_membership_path(assigns(:project_membership))
  end

  test "should show project_membership" do
    get :show, id: @project_membership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_membership
    assert_response :success
  end

  test "should update project_membership" do
    put :update, id: @project_membership, project_membership: { joined: @project_membership.joined, leaved: @project_membership.leaved }
    assert_redirected_to project_membership_path(assigns(:project_membership))
  end

  test "should destroy project_membership" do
    assert_difference('ProjectMembership.count', -1) do
      delete :destroy, id: @project_membership
    end

    assert_redirected_to project_memberships_path
  end
end
