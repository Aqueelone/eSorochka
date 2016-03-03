require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /static_pages' do
    it 'static pages home works!' do
      get '/home'
      expect(response).to have_http_status(200)
    end

    it 'static pages contacts works!' do
      get '/contacts'
      expect(response).to have_http_status(200)
    end

    it 'static pages about works!' do
      get '/about'
      expect(response).to have_http_status(200)
    end

    it 'static pages userslist not works without auth!' do
      get '/userslist'
      expect(response).to have_http_status(302)
    end

    it 'static pages userslist works with auth!' do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      get '/userslist'
      expect(response).to have_http_status(200)
    end
  end
end
