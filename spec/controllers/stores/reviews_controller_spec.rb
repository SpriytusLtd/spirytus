require 'rails_helper'

RSpec.describe Stores::ReviewsController, type: :controller do
  describe 'GET #index' do
    it 'redirect to the /users/sign_in' do
      store1 = Store.create! email: 'store1@email.com', password: 'test1pass', name: 'test1', address: 'kut-1-1-1', phone_number: '090-1111-1111', budget: 900, detail: 'yeah'
      get :index, store_id: store1.id
      expect(response).to redirect_to('/users/sign_in')
    end
    it 'contain store data in @store' do
      store1 = Store.create! email: 'store1@email.com', password: 'test1pass', name: 'test1', address: 'kut-1-1-1', phone_number: '090-1111-1111', budget: 900, detail: 'yeah'
      user1 = User.create! email: 'user1@email.com', password: 'user1pass'
      StoreReview.create! user_id: user1.id, store_id: store1.id
      StoreReview.create! user_id: user1.id, store_id: store1.id
      sign_in :user, user1
      get :index, store_id: store1.id
      expect(assigns :store).to eq store1
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end
  describe 'GET #new' do
    it 'render template new' do
      store1 = Store.create! email: 'store1@email.com', password: 'test1pass', name: 'test1', address: 'kut-1-1-1', phone_number: '090-1111-1111', budget: 900, detail: 'yeah'
      user1 = User.create! email: 'user1@email.com', password: 'user1pass'
      sign_in :user, user1
      get :new, store_id: store1.id
      expect(response).to have_http_status(200)
      expect(response).to render_template('new')
      expect(assigns(:review)).to be_a_new(StoreReview)
    end
    it 'redirect to the /users/sign_in if user has not sign in yet' do
      store1 = Store.create! email: 'store1@email.com', password: 'test1pass', name: 'test1', address: 'kut-1-1-1', phone_number: '090-1111-1111', budget: 900, detail: 'yeah'
      get :new, store_id: store1.id
      expect(response).to redirect_to('/users/sign_in')
    end
  end
  describe 'POST #create' do
    it 'create review' do
      store1 = Store.create! email: 'store1@email.com', password: 'test1pass', name: 'test1', address: 'kut-1-1-1', phone_number: '090-1111-1111', budget: 900, detail: 'yeah'
      user1 = User.create! email: 'user1@email.com', password: 'user1pass'
      sign_in :user, user1
      post :create, store_id: store1.id, store_review: { body: 'abc' }
      saved_review = StoreReview.find_by(user_id: user1.id)
      expect(saved_review.body).to eq('abc')
      expect(saved_review.store_id).to eq(store1.id)
      expect(saved_review.user_id).to eq(user1.id)
    end
    it 'posting is deny if the user has already posted store review'
  end
end
