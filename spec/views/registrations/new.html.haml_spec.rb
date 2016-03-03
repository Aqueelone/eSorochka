require 'rails_helper'

RSpec.describe 'controller: devise/registrations action: new', type: :view do
  describe 'Registration page should have correct content' do
    before { visit new_user_registration_path }

    it "the label 'Email'" do
      expect(page).to have_content('Email')
    end

    it "the label 'Password'" do
      expect(page).to have_content('Password')
    end

    it "the button 'Sign up'" do
      expect(page).to have_button('Sign up')
    end

    it "the link 'Log in'" do
      expect(page).to have_link('Log in')
    end
  end
end
