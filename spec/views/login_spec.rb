require 'rails_helper'

RSpec.describe 'Log in session', type: :system do
  before :each do
    User.create(name: 'Reem', password: '123456', email: 'reem@gmail.com', confirmed_at: Time.now)
    visit new_user_session_path
  end

  describe 'index page for list users' do
    it 'I can see the username and password inputs and the Submit button.' do
      expect(page).to have_content('Email')
      expect(page).to have_content('password')
      expect(page).to have_content('Log in')
    end

    it 'When I click the submit button without filling
   in the username and the password, I get a detailed error.' do
      click_on 'Log in '
      expect(page).to have_content('Invalid Email or password')
    end

    it 'when I click the submit button after filling in the
    username and the password with incorrect data, I get a detailed error.' do
      fill_in 'Email', with: 'reem@gmail.com'
      fill_in 'Password', with: '126'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'When I click the submit button after filling in the
     username and the password with correct data, I am redirected to the root page.' do
      fill_in 'Email', with: 'reem@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page.current_path).to have_content('/')
    end
  end
end
