class ChangeLikeUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :author_id
  end
end
