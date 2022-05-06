require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'The number of comments will increased by one ' do
    user = User.new(name: 'Reem Salim', bio: 'Hello my name is reem I am 22 years old', posts_counter: 5)
    user.save

    post = Post.new(title: 'Hello Rails', text: 'I love rails', comments_counter: 4, likes_counter: 8,
                    author_id: user.id)
    post.save

    comment = Comment.new(author_id: user.id, post_id: post.id)
    comment.save

    expect(comment.post.comments_counter).to eql(5)
  end
end
