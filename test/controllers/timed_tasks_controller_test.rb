require 'test_helper'

class TimedTasksControllerTest < ActionController::TestCase
  setup do
    @timed_task = timed_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timed_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timed_task" do
    assert_difference('TimedTask.count') do
      post :create, timed_task: { interval: @timed_task.interval, measure_of_time: @timed_task.measure_of_time }
    end

    assert_redirected_to timed_task_path(assigns(:timed_task))
  end

  test "should show timed_task" do
    get :show, id: @timed_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timed_task
    assert_response :success
  end

  test "should update timed_task" do
    patch :update, id: @timed_task, timed_task: { interval: @timed_task.interval, measure_of_time: @timed_task.measure_of_time }
    assert_redirected_to timed_task_path(assigns(:timed_task))
  end

  test "should destroy timed_task" do
    assert_difference('TimedTask.count', -1) do
      delete :destroy, id: @timed_task
    end

    assert_redirected_to timed_tasks_path
  end
end
