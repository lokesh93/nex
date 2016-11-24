require 'test_helper'

class LocationOptionsControllerTest < ActionController::TestCase
  setup do
    @location_option = location_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_option" do
    assert_difference('LocationOption.count') do
      post :create, location_option: { name: @location_option.name }
    end

    assert_redirected_to location_option_path(assigns(:location_option))
  end

  test "should show location_option" do
    get :show, id: @location_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_option
    assert_response :success
  end

  test "should update location_option" do
    patch :update, id: @location_option, location_option: { name: @location_option.name }
    assert_redirected_to location_option_path(assigns(:location_option))
  end

  test "should destroy location_option" do
    assert_difference('LocationOption.count', -1) do
      delete :destroy, id: @location_option
    end

    assert_redirected_to location_options_path
  end
end
