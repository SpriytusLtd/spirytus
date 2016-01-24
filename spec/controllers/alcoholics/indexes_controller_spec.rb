require 'rails_helper'

RSpec.describe Alcoholics::IndexesController, type: :controller do
  describe 'GET #index' do
    context 'if store_user is signed in' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'responds successfully with an HTTP 200 status code' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it 'render :index template' do
        get :index
        expect(response).to render_template(:index)
      end
      it 'array contain alcoholic model' do
        get :index
        expect(assigns(:alcoholics)).to match_array(Alcoholic.all)
      end
    end
    context 'if store_user is not signed in' do
      it 'redirect to sign in page' do
        get :index
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end

  describe 'GET #new' do
    context 'when store_user is signed in' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'responds successfully with an HTTP 200 status code' do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it '@alcoholic is new object of Alcoholic model' do
        get :new
        expect(assigns(:alcoholic)).to be_a_new(Alcoholic)
      end
      it 'render :new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
    context 'when store_user is not signed in' do
      it 'redirect to sign in page of store' do
        get :new
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end

  describe 'POST #create' do
    context 'when store_user is signed in,' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'responds successfully with an HTTP 302 status code' do
        post :create, alcoholic: { name: 'name', item1: 'item1', item2: 'item2' }
        expect(response).to have_http_status(302)
      end
      it 'save successfully alcoholic model' do
        alcoholic = Alcoholic.create(name: 'name', item1: 'item1', item2: 'item2')
        post :create, alcoholic: { name: 'name', item1: 'item1', item2: 'item2' }
        expect(Alcoholic.all).to include(alcoholic)
      end
      it 'redirect to index page' do
        post :create, alcoholic: { name: 'name', item1: 'item1', item2: 'item2' }
        expect(response).to redirect_to('/alcoholics')
      end
    end
    context 'if store_user is not signed in' do
      it 'redirect to sign in page of store' do
        post :create, alcoholic: { name: 'name', item1: 'item1', item2: 'item2' }
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when store_user is signed in' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it '@alcoholic is new object of Alcoholic model' do
        alcoholic = FactoryGirl.create(:alcoholic)
        delete :destroy, id: alcoholic
        expect(response).to redirect_to('/alcoholics')
      end
    end
    context 'when store_user is not signed in' do
      it 'redirect to sign in page of store' do
        alcoholic = FactoryGirl.create(:alcoholic)
        delete :destroy, id: alcoholic
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end
end
