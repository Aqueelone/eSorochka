require 'rails_helper'

RSpec.describe 'Application partial _footer:', type: :view do
  describe 'footer contents' do
    before { visit '/' }

    it "should have the content 'Sitesupport'" do
      expect(page).to have_content('Sitesupport')
    end

    it "should have the link 'Find us on GITHUB!'" do
      expect(page).to have_link('Find us on GITHUB!')
    end
  end
end
