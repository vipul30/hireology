require 'test_helper'

class JobControllerTest < ActionController::TestCase

  

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job" do

    post :create, job: {title: 'An awesome job.', location: 'Chicago, Il', description: 'This is an amazing programming position.', is_active: true}
    assert_response :redirect
  end

  test "should get show" do
   
    get :show, {id: 10}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: 10}
    assert_response :success
  end

  test "should update job" do
    post :update, job: {id: '14', title: 'An awesome job - updated.', location: 'Chicago, Il', description: 'This is an amazing programming position.', is_active: true}
    assert_response :redirect
  end

  test "should get delete" do
    get :delete, {id: 14}
    assert_response :redirect
  end

end
