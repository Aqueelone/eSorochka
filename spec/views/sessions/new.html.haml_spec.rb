require 'rails_helper'

RSpec.describe 'controller: devise/session action: new', type: :view do
  describe 'Log in page should have correct content' do
    before { visit new_user_session_path }

    it "the label 'Email'" do
      expect(page).to have_content('Email')
    end

    it "the label 'Password'" do
      expect(page).to have_content('Password')
    end

    it "the button 'Log in" do
      expect(page).to have_button('Log in')
    end

    it "the link 'Sign up'" do
      expect(page).to have_link('Sign up')
    end

    it "the label 'Remember me'" do
      expect(page).to have_content('Remember me')
    end

    it "the input check box 'Remember me' is checkable" do
      check('user_remember_me')
    end

    it "the link 'Forgot your password?'" do
      expect(page).to have_link('Forgot your password?')
    end
  end
end
