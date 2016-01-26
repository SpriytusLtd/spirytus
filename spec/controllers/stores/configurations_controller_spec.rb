require 'rails_helper'

RSpec.describe Stores::ConfigurationsController, type: :controller do
  describe 'GET #index' do
    it 'render index template' do
      store1 = FactoryGirl.create(:store1)
      sign_in :store, store1
      get :index, store_id: store1
      expect(response).to render_template('index')
      expect(assigns(:store)).to eq(store1)
    end
    it 'redirect to / if auth is denied' do
      store1 = FactoryGirl.create(:store1)
      store2 = FactoryGirl.create(:store2)
      sign_in :store, store1
      get :index, store_id: store2
      expect(response).to redirect_to('/')
    end
    it 'redirect to /stores/sign_in if store account is not logged in' do
      store1 = FactoryGirl.create(:store1)
      get :index, store_id: store1
      expect(response).to redirect_to('/stores/sign_in')
    end
  end
  describe 'POST #create' do
    it 'redirect to :index' do
      store1 = FactoryGirl.create(:store1)
      sign_in :store, store1
      post :create, store_id: store1.id, store: {
        name: 'warosu'
      }
      saved_store = Store.find(store1.id)
      expect(response).to redirect_to(store_path(saved_store))
      expect(saved_store[:name]).to eq('store1')
    end
  end
  describe 'GET #new' do
    it 'render new template' do
      store1 = FactoryGirl.create(:store1)
      sign_in :store, store1
      get :new, store_id: store1
      expect(response).to render_template('new')
      expect(assigns(:store)).to eq(store1)
    end
    it 'redirect to / if auth is denied' do
      store1 = FactoryGirl.create(:store1)
      store2 = FactoryGirl.create(:store2)
      sign_in :store, store1
      get :index, store_id: store2
      expect(response).to redirect_to('/')
    end
    it 'redirect to /stores/sign_in if store account is not logged in' do
      store1 = FactoryGirl.create(:store1)
      get :index, store_id: store1
      expect(response).to redirect_to('/stores/sign_in')
    end
  end
end
