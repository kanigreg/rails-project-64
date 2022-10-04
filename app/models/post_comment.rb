# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_ancestry

  validates :content, presence: true

  def new_child
    children.new(post_id: post_id, user_id: user_id)
  end
end
