# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post

  has_ancestry

  def new_child
    children.new(post_id: post_id)
  end
end
