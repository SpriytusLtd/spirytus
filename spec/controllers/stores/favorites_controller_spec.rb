require 'rails_helper'

RSpec.describe Stores::FavoritesController, type: :controller do
  describe 'POST #create' do
    it 'redirect to :store if request is successfully acceptance' do
      user1 = FactoryGirl.create(:user1)
      store1 = FactoryGirl.create(:store1)
      sign_in :user, user1
      post :create, store_id: store1.id
      expect(response).to have_http_status(201)
      expect(store1.users_who_likes).to include(user1)
      expect(user1.favorite_stores).to include(store1)
    end
  end
  describe 'DELETE #destroy'
end
