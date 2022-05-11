class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def display_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_posts_counter_add
  after_destroy :update_posts_counter_delete

  def update_posts_counter_delete
    author.decrement!(:posts_counter)
  end

  private

  def update_posts_counter_add
    author.increment!(:posts_counter)
  end
end
