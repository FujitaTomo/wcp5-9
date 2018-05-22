class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :title
      t.text :image_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
