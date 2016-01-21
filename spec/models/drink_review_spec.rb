require 'rails_helper'

RSpec.describe DrinkReview, type: :model do
  describe 'with validation' do
    let(:drink_review) { DrinkReview.new(params) }
    let(:params) do
      hash = {}
      hash[:user_id] = 0
      hash[:drink_id] = 0
      hash[:body] = 'すごかった。'
      hash[:param1] = 0
      hash[:param2] = 0
      hash[:param3] = 0
      hash[:param4] = 0
      hash[:param5] = 0
      hash[:param6] = 0
      hash
    end
    shared_examples 'be valid' do
      it { expect(drink_review).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(drink_review).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
      context 'when param3 is not present' do
        before do
          drink_review.param3 = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when param4 is not present' do
        before do
          drink_review.param4 = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when param5 is not present' do
        before do
          drink_review.param5 = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when param6 is not present' do
        before do
          drink_review.param6 = nil
        end
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when user_id is not present' do
        before do
          drink_review.user_id = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when drink_id is not present' do
        before do
          drink_review.drink_id = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when body is not present' do
        before do
          drink_review.body = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when param1 is not present' do
        before do
          drink_review.param1 = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when param2 is not present' do
        before do
          drink_review.param2 = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when body is over limit' do
        before do
          str1001 = 'n' * 1001
          drink_review.body = str1001
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
