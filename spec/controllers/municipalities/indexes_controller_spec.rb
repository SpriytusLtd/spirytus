require 'rails_helper'

RSpec.describe Municipalities::IndexesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      store1 = FactoryGirl.create(:store1)
      sign_in :store, store1
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      store1 = FactoryGirl.create(:store1)
      sign_in :store, store1
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      store1 = FactoryGirl.create(:store1)
      sign_in :store, store1
      post :create, municipality: { name: '香美市土佐山田町' }
      expect(response).to have_http_status(302)
    end
  end
end
