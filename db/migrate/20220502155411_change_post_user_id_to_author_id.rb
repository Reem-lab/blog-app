class ChangePostUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :author_id
    rename_column :posts, :CommentsCounter, :comments_counter
    rename_column :posts, :LikesCounter, :likes_counter
  end
end
