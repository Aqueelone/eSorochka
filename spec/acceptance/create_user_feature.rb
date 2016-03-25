require 'spec_helper'
require 'rails_helper'

feature 'Create a user', '
  In order to have an awesome ticket
  As an author
  User should create a ticket
  With correct credentals
' do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  scenario 'Changing Waiting for Customer status', js: true do
    visit '/'
    click_link 'Sign Up'
    within('#session') do
      fill_in 'login', with: 'OneAdmin'
      fill_in 'password', with: 'adminPassword'
      fill_in 'confirm_password', with: 'adminPassword'
      fill_in 'email', with: 'user@example.com'
    end
    click_button 'OK'
    expect(page).to have_content 'Success'
    UserMailer.should_receive(:deliver_ticket).with('email@example.com', 'OneAdmin')
    expect(page).to have_link 'Logoff'
  end
end
