class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :reply_post

      t.timestamps null: false
    end
  end
end
