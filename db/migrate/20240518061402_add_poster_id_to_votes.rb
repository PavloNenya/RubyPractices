class AddPosterIdToVotes < ActiveRecord::Migration[7.1]
  def change
    add_column :votes, :poster_id, :integer
  end
end
