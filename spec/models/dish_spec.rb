require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'with validation' do
    let(:dish) { Dish.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = 'レタス炒め'
      hash[:detail] = 'うまい'
      hash
    end
    shared_examples 'be valid' do
      it { expect(dish).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(dish).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
      context 'when detail is not present' do
        before do
          dish.detail = nil
        end
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          dish.name = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is over limit' do
        before do
          str101 = 'n' * 101
          dish.name = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when detail is over limit' do
        before do
          str1001 = 'n' * 1001
          dish.detail = str1001
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
