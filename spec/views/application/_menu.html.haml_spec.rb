require 'rails_helper'

RSpec.describe 'Application partial _menu:', type: :view do
  describe 'Page without current user' do
    before { visit '/' }

    it "should have the link 'Home'" do
      expect(page).to have_link('Home')
    end

    it "should have the link 'About Us'" do
      expect(page).to have_link('About Us')
    end

    it "should have the link 'Contacts'" do
      expect(page).to have_link('Contacts')
    end

    it "should have the link 'Sign Up'" do
      expect(page).to have_link('Sign Up')
    end

    it "should have the link 'Log In'" do
      expect(page).to have_link('Log In')
    end

    it "shouldn't have the link 'Log Out'" do
      expect(page).to have_no_link('Log Out')
    end

    it "shouldn't have the link 'Account'" do
      expect(page).to have_no_link('Account')
    end

    it "shouldn't have the link 'Users'" do
      expect(page).to have_no_link('Users')
    end

    it "shouldn't have the link 'My profile'" do
      expect(page).to have_no_link('My profile')
    end

    it "shouldn't have the link 'Assign for me'" do
      expect(page).to have_no_link('Assign for me')
    end

    it "shouldn't have the link 'Waiting for Customer'" do
      expect(page).to have_no_link('Waiting for Customer')
    end

    it "shouldn't have the link 'On hold'" do
      expect(page).to have_no_link('On hold')
    end

    it "shouldn't have the link 'Tickets'" do
      expect(page).to have_no_link('Tickets')
    end

    it "shouldn't have the link 'All tickets'" do
      expect(page).to have_no_link('All tickets')
    end

    it "shouldn't have the link 'Wait for Staff Response'" do
      expect(page).to have_no_link('Wait for Staff Response')
    end
  end

  describe 'Page with current user' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it "should have the link 'Home'" do
      expect(page).to have_link('Home')
    end

    it "should have the link 'About Us'" do
      expect(page).to have_link('About Us')
    end

    it "should have the link 'Contacts'" do
      expect(page).to have_link('Contacts')
    end

    it "shouldn't have the link 'Sign Up'" do
      expect(page).to have_no_link('Sign Up')
    end

    it "shouldn't have the link 'Log In'" do
      expect(page).to have_no_link('Log In')
    end

    it "should have the link 'Log Out'" do
      expect(page).to have_link('Log Out')
    end

    it "should have the link 'Account'" do
      expect(page).to have_link('Account')
    end

    it "should have the link 'Users'" do
      expect(page).to have_link('Users')
    end

    it "should have the link 'My profile'" do
      expect(page).to have_link('My profile')
    end

    it "should have the link 'Assign for me'" do
      expect(page).to have_link('Assign for me')
    end

    it "should have the link 'Waiting for Customer'" do
      expect(page).to have_link('Waiting for Customer')
    end

    it "should have the link 'On hold'" do
      expect(page).to have_link('On hold')
    end

    it "should have the link 'Tickets'" do
      expect(page).to have_link('Tickets')
    end

    it "should have the link 'All tickets'" do
      expect(page).to have_link('All tickets')
    end

    it "should have the link 'Wait for Staff Response'" do
      expect(page).to have_link('Wait for Staff Response')
    end
  end
end
