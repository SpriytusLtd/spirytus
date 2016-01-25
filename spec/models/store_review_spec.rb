require 'rails_helper'

RSpec.describe StoreReview, type: :model do
  describe 'with validation' do
    let(:store_review) { StoreReview.new(params) }
    let(:params) do
      hash = {}
      hash[:user_id] = 0
      hash[:store_id] = 0
      hash[:body] = 'やばかった'
      hash
    end
    shared_examples 'be valid' do
      it { expect(store_review).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(store_review).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
      context 'when body is not present' do
        before do
          store_review.body = nil
        end
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when user_id is not present' do
        before do
          store_review.user_id = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when store_id is not present' do
        before do
          store_review.store_id = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when body is over limit' do
        before do
          str1001 = 'n' * 1001
          store_review.body = str1001
        end
        it_behaves_like 'not be valid'
      end
    end
  end
  describe 'with method' do
    describe 'with search method' do
      context 'when true case' do
        it 'search by user_id ' do
          store_review1_1 = FactoryGirl.create(:store_review1_1)
          expect(StoreReview.search(store_review1_1.user_id, nil).first).to eq(store_review1_1)
        end
        it 'search by store_id ' do
          store_review1_1 = FactoryGirl.create(:store_review1_1)
          expect(StoreReview.search(nil, store_review1_1.store_id).first).to eq(store_review1_1)
        end
        it 'search by user_id & store_id ' do
          store_review1_1 = FactoryGirl.create(:store_review1_1)
          expect(StoreReview.search(store_review1_1.user_id, store_review1_1.store_id).first).to eq(store_review1_1)
        end
      end
      context 'when false case' do
        it 'store_review is not exist ' do
          expect(StoreReview.search(1, 1).first).to be_nil
        end
      end
    end
  end
end
