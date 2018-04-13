class AddDiscussionIdToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :discussion_id, :integer
  end
end
