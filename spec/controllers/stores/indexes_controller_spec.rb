require 'rails_helper'

RSpec.describe Stores::IndexesController, type: :controller do
  describe 'GET #show' do
    context 'user or store_user is not signed in' do
      it 'responds successfully with an HTTP 200 status code' do
        store1 = FactoryGirl.create(:store1, municipality: FactoryGirl.create(:municipality))
        get :show, id: store1.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it 'render :index template' do
        store1 = FactoryGirl.create(:store1, municipality: FactoryGirl.create(:municipality))
        get :show, id: store1.id
        expect(response).to render_template(:show)
      end
      it 'array contain alcoholic model' do
        store1 = FactoryGirl.create(:store1, municipality: FactoryGirl.create(:municipality))
        get :show, id: store1.id
        expect(assigns(:store)).to eq(store1)
      end
    end
  end
end
