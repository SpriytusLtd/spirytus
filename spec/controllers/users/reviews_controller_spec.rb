require 'rails_helper'

RSpec.describe Users::ReviewsController, type: :controller do
  describe 'GET #index' do
    it 'render index template' do
      user1 = FactoryGirl.create(:user1)
      store1 = FactoryGirl.create(:store1)
      store2 = FactoryGirl.create(:store2)
      review1 = StoreReview.create!(user_id: user1.id, store_id: store1.id, body: 'hey')
      review2 = StoreReview.create!(user_id: user1.id, store_id: store2.id, body: 'yeah')
      sign_in :user, user1
      get :index, user_id: user1.id
      expect(assigns(:store_reviews)).to match_array([review1, review2])
    end
  end
  describe 'POST #create'
  describe 'DELETE #destroy'
end
