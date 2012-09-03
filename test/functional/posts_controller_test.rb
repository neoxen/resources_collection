require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @subject = subjects(:normal)
    @post = posts(:normal)
    @user = users(:one)
  end

  test "should get index" do
    get :index, subject_id: @subject
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, subject_id: @subject
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      sign_in :user, @user
      post :create, post: { title: @post.title, content: @post.content }, subject_id: @subject
    end 

    assert_redirected_to subject_posts_path(@subject)
  end

  test "should get edit" do
    get :edit, subject_id:@subject, id: @post
    assert_response :success
  end

  test "should update post" do
    put :update, subject_id: @subject, id: @post, post: { title: @post.title, content: @post.content,  user_id: @post.user_id }
    assert_redirected_to subject_posts_path(@subject)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, subject_id: @subject, id: @post
    end

    assert_redirected_to subject_posts_path(@subject)
  end
end
