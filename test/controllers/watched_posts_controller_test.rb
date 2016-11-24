require 'test_helper'

class WatchedPostsControllerTest < ActionController::TestCase
  setup do
    @watched_post = watched_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:watched_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create watched_post" do
    assert_difference('WatchedPost.count') do
      post :create, watched_post: { post_id: @watched_post.post_id, user_id: @watched_post.user_id }
    end

    assert_redirected_to watched_post_path(assigns(:watched_post))
  end

  test "should show watched_post" do
    get :show, id: @watched_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @watched_post
    assert_response :success
  end

  test "should update watched_post" do
    patch :update, id: @watched_post, watched_post: { post_id: @watched_post.post_id, user_id: @watched_post.user_id }
    assert_redirected_to watched_post_path(assigns(:watched_post))
  end

  test "should destroy watched_post" do
    assert_difference('WatchedPost.count', -1) do
      delete :destroy, id: @watched_post
    end

    assert_redirected_to watched_posts_path
  end
end
