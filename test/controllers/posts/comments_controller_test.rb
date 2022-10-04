# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @attrs = { content: Faker::Lorem.sentence }

    sign_in users(:two)
  end

  test 'should post create' do
    post post_comments_path(@post), params: { post_comment: @attrs }

    assert_redirected_to post_path(@post)
  end

  test 'should post create children' do
    @attrs[:parent_id] = @comment.new_child.parent_id

    post post_comments_path(@post), params: { post_comment: @attrs }

    @comment.reload
    assert { @comment.children.count == 2 }
    assert_redirected_to post_path(@post)
  end
end
