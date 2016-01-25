require 'rails_helper'

RSpec.describe Dishes::IndexesController, type: :controller do
  describe 'GET #index' do
    context 'when store is signed in,' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'returns http success' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(:success)
      end
      it '@dishes contain dishes' do
        dish1 = Dish.create(name: 'b1')
        dish2 = Dish.create(name: 'b2')
        dish3 = Dish.create(name: 'b3')
        get :index
        expect(assigns(:dishes)).to match_array([dish1, dish2, dish3])
      end
    end
  end

  describe 'GET #new' do
    context 'when store is signed in,' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
      it 'render new template' do
        get :new
        expect(response).to render_template('new')
      end
      it '@dish is new object of dish model' do
        get :new
        expect(assigns(:dish)).to be_a_new(Dish)
      end
    end
    context 'when store is not signed in,' do
      it 'redirect to /stores/sign_in' do
        get :new
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end

  describe 'POST #create' do
    context 'when store is signed in,' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'returns http 302' do
        post :create, dish: { name: 'dish' }
        expect(response).to have_http_status(302)
      end
      it 'redirect to :index' do
        post :create, dish: { name: 'dish' }
        expect(response).to redirect_to(dishes_path)
      end
    end
    context 'when store is not signed in,' do
      it 'redirect to /stores/signed_in' do
        post :create, dish: { name: 'dish' }
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end

  describe 'GET #show'

  describe 'DELETE #destroy' do
    context 'when store is signed in,' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'redirect to :index' do
        dish = FactoryGirl.create(:dish)
        delete :destroy, id: dish
        expect(response).to redirect_to(dishes_path)
      end
      xit 'destroy dish object from db' do
        dish = FactoryGirl.create(:dish)
        dish.create(name: 'dish1')
        delete :destroy, id: dish
        expect(assigns(dish.all)).not_to include(dish)
      end
    end
    context 'when store is not signed in,' do
      it 'redirect to /stores/signed_in' do
        dish = FactoryGirl.create(:dish)
        delete :destroy, id: dish
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end
end
