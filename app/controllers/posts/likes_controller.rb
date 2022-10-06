# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    authenticate_user!

    @like = PostLike.find_or_create_by(post: resource_post, user: current_user)

    redirect_to resource_post
  end

  def destroy
    authenticate_user!

    PostLike.destroy_by(id: params[:id])

    redirect_to resource_post
  end
end
