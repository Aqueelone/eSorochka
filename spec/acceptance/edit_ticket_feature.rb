require 'spec_helper'
require 'rails_helper'

feature 'Admin edit a ticket', "
  For change a ticket status
  Admin should manage this ticket status
  With status from sets of correct ticket statuses:
  'Waiting for Staff Response',
  'Waiting for Customer',
  'On Hold', 'Cancelled', 'Completed'
  And User should receive message via email about it
" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  background do
    User.create!(name: 'OneAdmin', password: 'adminPassword',
                 confirm_password: 'adminPassword')
    Ticket.create!(name: 'Jimmy Bean', email: 'user@example.com',
                   text: 'bla bla bla', status: 'Waiting for Staff Response',
                   reference: 'ABC-123456')
    visit '/'
    click_link 'login'
    within('#session') do
      fill_in 'login', with: 'OneAdmin'
      fill_in 'password', with: 'adminPassword'
    end
    click_button 'OK'
    expect(page).to have_content 'Success'
  end

  scenario 'Changing Waiting for Customer status', js: true do
    visit '/ticket'
    page.find('li', reference: 'ABC-123456').click_link('Edit')
    within('#session') do
      page.select 'Waiting for Customer', from: 'Status'
    end
    click_button 'Submit'
    expect(page).to have_content 'Success'
    expect(page.find('li', reference: 'ABC-123456')).to have_content 'Waiting for Customer'
    UserMailer.should_receive(:deliver_ticket_change).with('email@example.com', 'Jimmy Bean')
    click_link 'logoff'
  end

  scenario 'Changing On Hold status', js: true do
    visit '/ticket'
    page.find('li', reference: 'ABC-123456').click_link('Edit')
    within('#session') do
      page.select 'On Hold', from: 'Status'
    end
    click_button 'Submit'
    expect(page).to have_content 'Success'
    expect(page.find('li', reference: 'ABC-123456')).to have_content 'On Hold'
    UserMailer.should_receive(:deliver_ticket_change).with('email@example.com', 'Jimmy Bean')
    click_link 'logoff'
  end

  scenario 'Changing Cancelled status', js: true do
    visit '/ticket'
    page.find('li', reference: 'ABC-123456').click_link('Edit')
    within('#session') do
      page.select 'Cancelled', from: 'Status'
    end
    click_button 'Submit'
    expect(page).to have_content 'Success'
    expect(page.find('li', reference: 'ABC-123456')).to have_content 'On Hold'
    UserMailer.should_receive(:deliver_ticket_change).with('email@example.com', 'Jimmy Bean')
    click_link 'logoff'
  end

  scenario 'Changing Completed status', js: true do
    visit '/ticket'
    page.find('li', reference: 'ABC-123456').click_link('Edit')
    within('#session') do
      page.select 'Completed', from: 'Status'
    end
    click_button 'Submit'
    expect(page).to have_content 'Success'
    expect(page.find('li', reference: 'ABC-123456')).to have_content 'On Hold'
    UserMailer.should_receive(:deliver_ticket_change).with('email@example.com', 'Jimmy Bean')
    click_link 'logoff'
  end
end
