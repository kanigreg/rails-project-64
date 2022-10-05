# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    authenticate_user!

    like = PostLike.create(post: resource_post, user: current_user)

    if like.save
      redirect_to resource_post
    else
      render 'post/show', status: :unprocessable_entity
    end
  end

  def destroy
    authenticate_user!

    like = PostLike.find_by(post: resource_post, user: current_user)

    like.destroy

    redirect_to resource_post
  end
end
