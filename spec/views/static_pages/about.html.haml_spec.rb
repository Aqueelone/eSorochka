require 'rails_helper'

RSpec.describe 'static_pages/about.html.haml', type: :view do
  describe 'About page' do
    it "should have the content 'About Us'" do
      visit '/about'
      expect(page).to have_content('About')
    end
  end
end
