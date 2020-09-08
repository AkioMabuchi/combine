class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :theme_image_id_1
      t.integer :theme_image_id_2
      t.string :description

      t.timestamps
    end
  end
end
