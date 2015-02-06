class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :category, null: false
      t.integer :post_id
    end
  end
end
