class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.boolean :super_user, default: false
    end
  end
end
