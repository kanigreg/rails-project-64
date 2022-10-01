# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :posts, foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy
  has_many :favorite_posts, through: :post_likes
end
