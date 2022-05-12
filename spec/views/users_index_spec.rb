require 'rails_helper'

RSpec.describe 'User index', type: :system do
  before :each do
    User.create(id: 12, name: 'Reem', bio: 'hello there', photo: 'none',
                password: '123456', email: 'reem@gmail.com', posts_counter: 4, confirmed_at: Time.now)
    visit new_user_session_path
    fill_in 'Email', with: 'reem@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  describe 'index page for list users' do
    it 'I can see the username of all other users.' do
      expect(page).to have_content('Reem')
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_content('img')
    end

    it 'I can see the number of posts each user has written..' do
      expect(page).to have_content('number of posts: 4')
    end

    it "When I click on a user, I am redirected to that user's show page." do
      click_link 'reem'
      expect(page.current_path).to have_content('/users/12')
    end
  end
end
