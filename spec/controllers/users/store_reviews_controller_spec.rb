require 'rails_helper'

RSpec.describe Users::StoreReviewsController, type: :controller do
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
      expect(response).to render_template('index')
    end
    it 'redirect to / if user account is different' do
      user1 = FactoryGirl.create(:user1)
      user2 = FactoryGirl.create(:user2)
      sign_in :user, user1
      get :index, user_id: user2
      expect(response).to redirect_to('/')
    end
    it 'redirect to /users/sign_in if user have not logged in yet' do
      user1 = FactoryGirl.create(:user1)
      get :index, user_id: user1.id
      expect(response).to redirect_to('/users/sign_in')
    end
  end
  describe 'GET #show' do
    it 'render show template' do
      user1 = FactoryGirl.create(:user1)
      store1 = FactoryGirl.create(:store1)
      review1 = StoreReview.create!(user_id: user1.id, store_id: store1.id, body: 'hey')
      sign_in :user, user1
      get :show, user_id: user1.id, id: review1.id
      expect(response).to render_template('show')
      expect(assigns(:store_review)).to eq(review1)
    end
    it 'redirect to :index if user account is different' do
      user1 = FactoryGirl.create(:user1)
      user2 = FactoryGirl.create(:user2)
      store1 = FactoryGirl.create(:store1)
      review1 = StoreReview.create!(user_id: user1.id, store_id: store1.id, body: 'hey')
      sign_in :user, user1
      get :show, user_id: user2, id:  review1.id
      expect(response).to redirect_to(user_path(user1))
    end
    it 'redirect to /users/sign_in if user have not logged in yet' do
      user1 = FactoryGirl.create(:user1)
      store1 = FactoryGirl.create(:store1)
      review1 = StoreReview.create!(user_id: user1.id, store_id: store1.id, body: 'hey')
      get :show, user_id: user1.id, id: review1.id
      expect(response).to redirect_to('/users/sign_in')
    end
  end
  describe 'DELETE #destroy' do
    it 'redirect to :index if review successfully destroyed'
    it 'redirect to :index if review is not exist'
    it 'redirect to /users/sign_in if user have not logged in yet'
  end
end
