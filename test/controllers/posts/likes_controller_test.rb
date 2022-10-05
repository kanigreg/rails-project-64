# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should post create' do
    sign_in users(:two)

    post post_likes_path(@post)

    assert { @post.likes.count == 2 }
    assert_redirected_to @post
  end

  test 'should delete destroy' do
    sign_in users(:one)

    delete post_like_path(@post)

    assert { @post.likes.count.zero? }
    assert_redirected_to @post
  end
end
