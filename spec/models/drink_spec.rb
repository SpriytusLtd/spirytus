require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe 'with validation' do
    let(:drink) { Drink.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = 'インスマス'
      hash[:alcohol] = 15
      hash[:detail] = 'いあ いあ くとぅるふ'
      hash[:alcoholic_id] = 0
      hash[:brewer_id] = 0
      hash
    end
    shared_examples 'be valid' do
      it { expect(drink).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(drink).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
      context 'when alcohol is not present' do
        before do
          drink.alcohol = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when alcoholic_id is not present' do
        before do
          drink.alcoholic_id = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when brewer_id is not present' do
        before do
          drink.brewer_id = nil
        end
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          drink.name = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is over limit' do
        before do
          str101 = 'n' * 101
          drink.name = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when alcohol is over limit' do
        before do
          degit3 = 10**4
          drink.alcohol = degit3
        end
        it_behaves_like 'not be valid'
      end
      context 'when detail is over limit' do
        before do
          str1001 = 'n' * 1001
          drink.detail = str1001
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
