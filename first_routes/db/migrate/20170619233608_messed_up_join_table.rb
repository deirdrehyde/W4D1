class MessedUpJoinTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :artwork_shares, :artist_id, :artwork_id
  end
end
