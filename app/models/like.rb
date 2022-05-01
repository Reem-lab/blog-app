class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_posts_counter
    post.find(2).update(LikesCounter: 12)
  end
end
