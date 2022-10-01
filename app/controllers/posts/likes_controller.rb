class Posts::LikesController < Posts::ApplicationController
  def create
    authenticate_user!

    like = PostLike.find_or_initialize_by(post: resource_post, user: current_user)

    if like.new_record?
      like.save
    else
      like.destroy
    end

    redirect_to resource_post
  end
end
