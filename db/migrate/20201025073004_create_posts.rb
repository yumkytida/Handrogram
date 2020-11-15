class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.string :image_id
      t.text :introduction

      t.timestamps
    end
    add_index :posts,[:user_id,:created_at]
  end
end
