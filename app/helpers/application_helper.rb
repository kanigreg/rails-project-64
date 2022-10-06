# frozen_string_literal: true

module ApplicationHelper
  def find_like(post, user = current_user)
    PostLike.find_by(post: post, user: user)
  end
end
