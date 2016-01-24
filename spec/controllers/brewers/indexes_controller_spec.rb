require 'rails_helper'

RSpec.describe Brewers::IndexesController, type: :controller do
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
      it '@brewers contain brewers' do
        brewer1 = Brewer.create(name: 'b1')
        brewer2 = Brewer.create(name: 'b2')
        brewer3 = Brewer.create(name: 'b3')
        get :index
        expect(assigns(:brewers)).to match_array([brewer1, brewer2, brewer3])
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
      it '@brewer is new object of Brewer model' do
        get :new
        expect(assigns(:brewer)).to be_a_new(Brewer)
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
        post :create, brewer: { name: 'brewer' }
        expect(response).to have_http_status(302)
      end
      it 'redirect to :index' do
        post :create, brewer: { name: 'brewer' }
        expect(response).to redirect_to(brewers_path)
      end
    end
    context 'when store is not signed in,' do
      it 'redirect to /stores/signed_in' do
        post :create, brewer: { name: 'brewer' }
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when store is signed in,' do
      before do
        store1 = FactoryGirl.create(:store1)
        sign_in :store, store1
      end
      it 'redirect to :index' do
        brewer = FactoryGirl.create(:brewer)
        delete :destroy, id: brewer
        expect(response).to redirect_to(brewers_path)
      end
      xit 'destroy brewer object from db' do
        brewer = FactoryGirl.create(:brewer)
        Brewer.create(name: 'brewer1')
        delete :destroy, id: brewer
        expect(assigns(Brewer.all)).not_to include(brewer)
      end
    end
    context 'when store is not signed in,' do
      it 'redirect to /stores/signed_in' do
        brewer = FactoryGirl.create(:brewer)
        delete :destroy, id: brewer
        expect(response).to redirect_to('/stores/sign_in')
      end
    end
  end
end
