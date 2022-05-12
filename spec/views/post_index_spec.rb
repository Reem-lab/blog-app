require 'rails_helper'

RSpec.describe 'Posts index', type: :system do
  before :each do
    @test = User.create(id: 42, name: 'Sedra', bio: 'hello there', photo: 'none',
                        password: '123456', email: 'sedra@gmail.com', posts_counter: 4, confirmed_at: Time.now)

    @test1 = Post.create(id: 14, author_id: 42, comments_counter: 2, likes_counter: 5,
                         title: 'Hello1', text: 'This is my first test', created_at: Time.now)

    @test2 = Post.create(id: 15, author_id: 42, comments_counter: 0, likes_counter: 5,
                         title: 'Hello2', text: 'This is my second test', created_at: Time.now)

    @test3 = Post.create(id: 16, author_id: 42, comments_counter: 0, likes_counter: 5,
                         title: 'Hello3', text: 'This is my third test', created_at: Time.now)

    @comment1 = Comment.create(id: 20, text: 'Beautiful!', author_id: 14)
    @comment2 = Comment.create(id: 21, text: 'very good!', author_id: 14)
    @comment3 = Comment.create(id: 22, text: 'very good!', author_id: 14)
    @comment4 = Comment.create(id: 23, text: 'very good!', author_id: 14)

    @like1 = Like.create(id: 85, author_id: 42, post_id: 15)
    @like2 = Like.create(id: 86, author_id: 42, post_id: 15)

    visit new_user_session_path
    fill_in 'Email', with: 'sedra@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Sedra'
    click_link 'test1'
    click_on 'see all posts'
  end

  describe 'index page for all posts with comments to one user' do
    it "I can see the user's profile picture." do
      expect(page).to have_content('img')
    end

    it "I can see the user's username." do
      expect(page).to have_content('Sedra')
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('number of posts: 3')
    end

    it "I can see a post's title." do
      expect(page).to have_content('hello1')
    end

    it "I can see some of the post's body." do
      expect(page).to have_content('This is my first test')
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('Beautiful!')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content('comments: 4')
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content('likes: 2')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      click_on 'test1'
      expect(page).to have_content('/users/42/posts/14')
    end
  end
end
