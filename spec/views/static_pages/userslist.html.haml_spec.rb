require 'rails_helper'

RSpec.describe 'static_pages/userslist.html.haml', type: :view do
  describe 'Userslist page' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it "should have the content 'List of Users'" do
      visit '/userslist'
      expect(page).to have_content('List of Users')
    end
  end
end
