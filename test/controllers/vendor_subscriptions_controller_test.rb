require 'test_helper'

class VendorSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @vendor_subscription = vendor_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_subscription" do
    assert_difference('VendorSubscription.count') do
      post :create, vendor_subscription: { subcategory_id: @vendor_subscription.subcategory_id, vendor_id: @vendor_subscription.vendor_id }
    end

    assert_redirected_to vendor_subscription_path(assigns(:vendor_subscription))
  end

  test "should show vendor_subscription" do
    get :show, id: @vendor_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_subscription
    assert_response :success
  end

  test "should update vendor_subscription" do
    patch :update, id: @vendor_subscription, vendor_subscription: { subcategory_id: @vendor_subscription.subcategory_id, vendor_id: @vendor_subscription.vendor_id }
    assert_redirected_to vendor_subscription_path(assigns(:vendor_subscription))
  end

  test "should destroy vendor_subscription" do
    assert_difference('VendorSubscription.count', -1) do
      delete :destroy, id: @vendor_subscription
    end

    assert_redirected_to vendor_subscriptions_path
  end
end
