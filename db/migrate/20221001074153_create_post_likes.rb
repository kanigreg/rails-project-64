class CreatePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.references :post, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
