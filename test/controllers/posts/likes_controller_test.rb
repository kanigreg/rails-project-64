# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  test 'should post create' do
    sign_in users(:two)
    post = posts(:without_likes)

    post post_likes_path(post)

    assert { PostLike.exists? post: post, user: users(:two) }
    assert_redirected_to post
  end

  test 'should delete destroy' do
    like = post_likes(:one)
    sign_in like.user

    delete post_like_path(like.post, like)

    assert_not PostLike.exists?(like.id)
    assert_redirected_to like.post
  end
end
