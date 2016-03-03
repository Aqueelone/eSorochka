require 'rails_helper'

RSpec.describe 'Application partial _messages:', type: :view do
  let(:user) { FactoryGirl.create(:user) }

  describe 'Successful action' do
    it "should be 'alert-success' type" do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page.all(:css, 'div.alert-success'))
    end
  end

  describe 'Invalid action' do
    it "should be 'alert-danger' type" do
      visit new_user_session_path
      fill_in 'Email', with: user.email + 'tt'
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page.all(:css, 'div.alert-danger'))
    end
  end

  describe 'Info-type action' do
    it "should be 'alert-info' type" do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      visit edit_user_registration_path
      fill_in 'Password', with: 'absdabsd'
      fill_in 'Password confirm', with: 'absdabsd'
      fill_in 'Current password', with: user.password
      click_button 'Update'
      expect(page.all(:css, 'div.alert-info'))
    end
  end
end
