require 'rails_helper'

RSpec.describe 'controller: devise/registrations action: edit', type: :view do
  describe 'Edit page should have correct content' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      visit edit_user_registration_path
    end

    it "input value with user's email" do
      expect(page.find_by_id('user_email').value).to have_content(user.email)
    end

    it "the label 'Email'" do
      expect(page).to have_content('Email')
    end

    it "the label 'Password'" do
      expect(page).to have_content('Password')
    end

    it "the label 'Password confirm'" do
      expect(page).to have_content('Password confirm')
    end

    it "the label 'Current password'" do
      expect(page).to have_content('Current password')
    end

    it "the button 'Update'" do
      expect(page).to have_button('Update')
    end

    it "the link 'Back'" do
      expect(page).to have_link('Back')
    end
  end
end
