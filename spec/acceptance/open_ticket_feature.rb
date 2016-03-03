require 'spec_helper'
require 'rails_helper'

feature 'User creates a ticket', '
  In order to have an awesome ticket
  As an author
  User should create a ticket
  With correct credentals
' do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  background do
    User.create!(name: 'OneAdmin', password: 'adminPassword',
                 confirm_password: 'adminPassword')
  end

  scenario 'Create ticket with  correct credentials', js: true do
    visit '/ticket/new'
    within('#session') do
      fill_in 'Name', with: 'Jimmy Bean'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Text', with: 'bla bla bla'
    end
    click_button 'OK'
    expect(page).to have_content 'Success'
    UserMailer.should_receive(:deliver_ticket).with('email@example.com', 'Jimmy Bean')
    visit '/'
    click_link 'login'
    within('#session') do
      fill_in 'login', with: 'OneAdmin'
      fill_in 'password', with: 'adminPassword'
    end
    click_button 'OK'
    visit '/ticket'
    expect(page).to have_content 'user@example.com'
  end

  scenario 'Create ticket with  not correct credentials', js: true do
    visit '/ticket/new'
    within('#session') do
      fill_in 'Name', with: 'Jimmy Bean'
      fill_in 'Email', with: 'user_example_com'
      fill_in 'Text', with: 'bla bla bla'
    end
    click_button 'OK'
    expect(page).to have_content 'Fail'
  end
end
