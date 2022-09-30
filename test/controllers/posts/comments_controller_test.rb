require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @attrs = { content: Faker::Lorem.sentence }
  end

  test 'should post create' do
    sign_in users(:two)

    post post_comments_path(@post), params: { post_comment: @attrs }

    assert_redirected_to post_path(@post)
  end
end
