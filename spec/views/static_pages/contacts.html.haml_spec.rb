require 'rails_helper'

RSpec.describe 'static_pages/contacts.html.haml', type: :view do
  describe 'About page' do
    it "should have the content 'Contacts'" do
      visit '/contacts'
      expect(page).to have_content('Contacts')
    end
  end
end
