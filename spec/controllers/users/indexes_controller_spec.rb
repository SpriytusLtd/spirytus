require 'rails_helper'

RSpec.describe Users::IndexesController, type: :controller do
  describe 'GET #show' do
    it 'render show template' do
      user1 = FactoryGirl.create(:user1)
      sign_in :user, user1
      get :show, id: user1.id
      expect(response).to have_http_status(200)
      expect(assigns(:user)).to eq(user1)
      expect(response).to render_template('show')
    end
    it 'access deny and redirect to top page if logged in user is different from requested user' do
      user1 = FactoryGirl.create(:user1)
      user2 = FactoryGirl.create(:user2)
      sign_in :user, user1
      get :show, id: user2
      expect(response).to redirect_to('/')
    end
    it 'redirect to /users/sign_in if user is not signed in' do
      user1 = FactoryGirl.create(:user1)
      get :show, id: user1
      expect(response).to redirect_to('/users/sign_in')
    end
  end
end
