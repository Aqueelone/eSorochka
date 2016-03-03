require 'rails_helper'

RSpec.describe '_link partials for devise', type: :view do
  describe 'Login page' do
    before { visit new_user_session_path }

    it "should have the link 'Sign up'" do
      expect(page.find_by_id('new_user')).to have_link('Sign up')
    end

    it "should have the link 'Forgot your password?'" do
      expect(page.find_by_id('new_user')).to have_link('Forgot your password?')
    end

    it "shouldn't have the link 'Log in'" do
      expect(page.find_by_id('new_user')).to have_no_link('Log in')
    end
  end

  describe 'Registration page' do
    before { visit new_user_registration_path }

    it "should have the link 'Log in'" do
      expect(page.find_by_id('new_user')).to have_link('Log in')
    end

    it "shouldn't have the link 'Sign up'" do
      expect(page.find_by_id('new_user')).to have_no_link('Sign up')
    end

    it "shouldn't have the link 'Forgot your password?'" do
      expect(page.find_by_id('new_user')).to have_no_link('Forgot your password?')
    end
  end
end
