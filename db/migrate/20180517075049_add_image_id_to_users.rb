class AddImageIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_image_id, :string
    add_column :users, :introduction, :string
  end
end
