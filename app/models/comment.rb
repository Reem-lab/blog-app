class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_comments_counter
  after_destroy :update_comments_counter_delete

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def update_comments_counter_delete
    post.decrement!(:comments_counter)
  end
end
