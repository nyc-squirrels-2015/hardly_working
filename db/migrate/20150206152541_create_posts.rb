class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :photo_url, null: false
      t.text    :title
      t.integer :positive_score, default: 0
      t.integer :negative_score, default: 0
      t.integer :user_id
    end
  end
end
