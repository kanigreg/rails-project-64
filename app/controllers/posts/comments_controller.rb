# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    authenticate_user!

    @comment = resource_post.comments.build(user: current_user, **comment_params)

    if @comment.save
      redirect_to resource_post, notice: t('.success')
    else
      flash[:error] = @comment.errors.full_messages.join(' ')
      redirect_to resource_post
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content parent_id])
  end
end
