require 'test_helper'

class OptionsCityListsControllerTest < ActionController::TestCase
  setup do
    @options_city_list = options_city_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:options_city_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create options_city_list" do
    assert_difference('OptionsCityList.count') do
      post :create, options_city_list: { city_id: @options_city_list.city_id, location_option_id: @options_city_list.location_option_id }
    end

    assert_redirected_to options_city_list_path(assigns(:options_city_list))
  end

  test "should show options_city_list" do
    get :show, id: @options_city_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @options_city_list
    assert_response :success
  end

  test "should update options_city_list" do
    patch :update, id: @options_city_list, options_city_list: { city_id: @options_city_list.city_id, location_option_id: @options_city_list.location_option_id }
    assert_redirected_to options_city_list_path(assigns(:options_city_list))
  end

  test "should destroy options_city_list" do
    assert_difference('OptionsCityList.count', -1) do
      delete :destroy, id: @options_city_list
    end

    assert_redirected_to options_city_lists_path
  end
end
