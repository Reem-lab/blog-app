require 'rails_helper'

RSpec.describe Like, type: :model do

 it "The number of likes will increased by one " do 
    user = User.new(name: "Reem Salim", photo: "https://imgv3.fotor.com/images/homepage-feature-card/Fotor-AI-photo-enhancement-tool.jpg", bio: "Hello my name is reem I am 22 years old", posts_counter: 5)
    user.save
 
    post = Post.new(title: "Hello Rails", text: "I love rails", comments_counter: 4, likes_counter: 8, author_id: user.id)
    post.save
 
    like = Like.new(author_id: user.id, post_id: post.id)
    like.save
 
    expect(like.post.likes_counter).to eql(9)
 end


end
