class AddImageToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :image, :string
  end
end
