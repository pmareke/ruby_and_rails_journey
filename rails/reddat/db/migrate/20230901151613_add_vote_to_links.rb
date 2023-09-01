class AddVoteToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :upvote, :integer, default: 0
    add_column :links, :downvote, :integer, default: 0
  end
end
