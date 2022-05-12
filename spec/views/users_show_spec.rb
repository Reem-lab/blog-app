require 'rails_helper'

RSpec.describe 'User show', type: :system do
  before :each do
    @test1 = User.create(id: 42, name: 'Sedra', bio: 'hello there', photo: 'none',
                         password: '123456', email: 'sedra@gmail.com', posts_counter: 4, confirmed_at: Time.now)

    @test1.posts.create(id: 14, author_id: 42, comments_counter: 0, likes_counter: 5,
                        title: 'Hello1', text: 'This is my first test', created_at: Time.now)

    @test1.posts.create(id: 15, author_id: 42, comments_counter: 0, likes_counter: 5,
                        title: 'Hello2', text: 'This is my second test', created_at: Time.now)

    @test1.posts.create(id: 16, author_id: 42, comments_counter: 0, likes_counter: 5,
                        title: 'Hello3', text: 'This is my third test', created_at: Time.now)

    visit new_user_session_path
    fill_in 'Email', with: 'sedra@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Sedra'
  end

  describe 'show page for one users' do
    it 'I can see the profile picture for each user.' do
      expect(page).to have_content('img')
    end

    it 'I can see the username of all other users.' do
      expect(page).to have_content('Sedra')
    end

    it 'I can see the number of posts each user has written..' do
      expect(page).to have_content('number of posts: 4')
    end

    it "I can see the user's bio.." do
      expect(page).to have_content('hello there')
    end

    it "I can see the user's first 3 posts." do
      expect(page).to have_content('This is my first test')
      expect(page).to have_content('This is my second test')
      expect(page).to have_content('This is my third test')
    end

    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content('See all posts')
    end

    it "When I click a user's post, it redirects me to that post's show page.." do
      click_link 'Hello1'
      expect(page.current_path).to have_content('/users/42/posts/14')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_link 'See all posts'
      expect(page.current_path).to have_content('/users/42/posts')
    end
  end
end
