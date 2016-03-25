require 'rails_helper'

feature 'users specific action' do
  context 'users registrations' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit new_user_registration_path }

    scenario 'users correct registration' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'testPassword'
      fill_in 'Password confirmation', with: 'testPassword'
      click_button 'Sign up'
      expect(page).to have_content 'successfully'
    end

    scenario 'users not correct registration (password too short)' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'test'
      fill_in 'Password confirmation', with: 'test'
      click_button 'Sign up'
      expect(page).to have_content 'error'
    end

    scenario "users not correct registration (confirmation don't match...)" do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'testPassword'
      fill_in 'Password confirmation', with: 'test'
      click_button 'Sign up'
      expect(page).to have_content 'error'
    end

    scenario 'users not correct registration (double emails)' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'testPassword'
      fill_in 'Password confirmation', with: 'testPassword'
      click_button 'Sign up'
      expect(page).to have_content 'error'
    end
  end
  context 'users session' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit new_user_session_path }

    scenario 'users correct login' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content 'successfully'
    end

    scenario 'users not correct login (not correct password)' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password + '123'
      click_button 'Log in'
      expect(page).to have_content 'Invalid'
    end

    scenario 'users not correct login (not correct email)' do
      fill_in 'Email', with: 'aa' + user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content 'Invalid'
    end
  end
end
feature 'users statistics action' do
  context 'users list' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "users can see 'userslist' and it is correct" do
      visit '/userslist'
      expect(page).to have_content user.email
    end
  end
end
