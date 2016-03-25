require 'rails_helper'

RSpec.describe 'static_pages/home.html.haml', type: :view do
  describe 'Home page' do
    it "should have the content 'Sitesupport'" do
      visit '/home'
      expect(page).to have_content('Sitesupport')
    end
  end
end
