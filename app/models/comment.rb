class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_posts_counter
    post.find(1).update(CommentsCounter: 15)
  end
end
