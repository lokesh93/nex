require 'test_helper'

class PhysicalLocationsControllerTest < ActionController::TestCase
  setup do
    @physical_location = physical_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_location" do
    assert_difference('PhysicalLocation.count') do
      post :create, physical_location: { address: @physical_location.address, business_email: @physical_location.business_email, business_phone: @physical_location.business_phone, business_website: @physical_location.business_website, city_id: @physical_location.city_id, fax: @physical_location.fax, other_phone: @physical_location.other_phone, postal_code: @physical_location.postal_code, sale_location: @physical_location.sale_location, vendor_id: @physical_location.vendor_id }
    end

    assert_redirected_to physical_location_path(assigns(:physical_location))
  end

  test "should show physical_location" do
    get :show, id: @physical_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_location
    assert_response :success
  end

  test "should update physical_location" do
    patch :update, id: @physical_location, physical_location: { address: @physical_location.address, business_email: @physical_location.business_email, business_phone: @physical_location.business_phone, business_website: @physical_location.business_website, city_id: @physical_location.city_id, fax: @physical_location.fax, other_phone: @physical_location.other_phone, postal_code: @physical_location.postal_code, sale_location: @physical_location.sale_location, vendor_id: @physical_location.vendor_id }
    assert_redirected_to physical_location_path(assigns(:physical_location))
  end

  test "should destroy physical_location" do
    assert_difference('PhysicalLocation.count', -1) do
      delete :destroy, id: @physical_location
    end

    assert_redirected_to physical_locations_path
  end
end
