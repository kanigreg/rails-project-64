# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    authenticate_user!

    @post = current_user.posts.build
  end

  def create
    authenticate_user!

    post = current_user.posts.build(post_params)

    if post.save
      redirect_to posts_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(%i[title body category_id])
  end
end
