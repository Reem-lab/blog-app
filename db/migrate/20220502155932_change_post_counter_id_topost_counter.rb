class ChangePostCounterIdTopostCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :PostsCounter, :posts_counter
  end
end
