# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:creator).order(created_at: :desc)
  end

  def new
    authenticate_user!

    @post = current_user.posts.build
  end

  def create
    authenticate_user!

    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments_tree = @post.comments.includes(:user).arrange
    @user_like = @post.likes.find_by(user: current_user)
    @comment = PostComment.new(post: @post)
  end

  private

  def post_params
    params.require(:post).permit(%i[title body category_id])
  end
end
