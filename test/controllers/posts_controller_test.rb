# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @attrs = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      category_id: categories(:one).id
    }
  end

  test 'should get index' do
    get posts_path

    assert_response :success
  end

  test 'should get show' do
    get post_path(@post)

    assert_response :success
  end

  test 'should post create' do
    sign_in @post.creator

    post posts_path, params: { post: @attrs }

    assert_redirected_to posts_path
  end

  test 'should get new' do
    sign_in @post.creator

    get new_post_path

    assert_response :success
  end

  test 'should redirect unauthorized' do
    get new_post_path

    assert_redirected_to new_user_session_path
  end
end
