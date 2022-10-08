# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :posts
  belongs_to :category

  has_many :comments,
           class_name: 'PostComment',
           dependent: :destroy,
           counter_cache: :comments_count
  has_many :likes,
           class_name: 'PostLike',
           dependent: :destroy,
           counter_cache: :likes_count

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 50 }
end
