require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @subject = subjects(:normal)
    @post = posts(:normal)
    @reply = replies(:normal)
    @user = users(:one)
  end

  test "should get index" do
    get :index, post_id: @post
    assert_response :success
    assert_not_nil assigns(:replies)
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      sign_in :user, @user
      post :create, post_id: @post, reply: { content: @reply.content }
    end

    assert_redirected_to post_replies_path(@post)
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete :destroy, post_id: @post, id: @reply
    end

    assert_redirected_to post_replies_path(@post)
  end
end
