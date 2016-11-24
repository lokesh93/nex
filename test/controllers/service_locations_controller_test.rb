require 'test_helper'

class ServiceLocationsControllerTest < ActionController::TestCase
  setup do
    @service_location = service_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_location" do
    assert_difference('ServiceLocation.count') do
      post :create, service_location: { city_id: @service_location.city_id, vendor_id: @service_location.vendor_id }
    end

    assert_redirected_to service_location_path(assigns(:service_location))
  end

  test "should show service_location" do
    get :show, id: @service_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_location
    assert_response :success
  end

  test "should update service_location" do
    patch :update, id: @service_location, service_location: { city_id: @service_location.city_id, vendor_id: @service_location.vendor_id }
    assert_redirected_to service_location_path(assigns(:service_location))
  end

  test "should destroy service_location" do
    assert_difference('ServiceLocation.count', -1) do
      delete :destroy, id: @service_location
    end

    assert_redirected_to service_locations_path
  end
end
