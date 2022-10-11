class ResetCounters < ActiveRecord::Migration[6.1]
  def up
    Post.ids { |id| Post.reset_counters(id, :comments, :likes) }
  end
end
