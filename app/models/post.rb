class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def display_comments
    comments.limit(5).order(created_at: :desc)
  end

  def update_posts_counter
    user.find(1).update(PostsCounter: 40)
  end
end
