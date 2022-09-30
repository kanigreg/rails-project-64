# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    authenticate_user!

    comment = resource_post.comments.build(comment_params)

    if comment.save
      redirect_to resource_post
    else
      @post = resource_post
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
