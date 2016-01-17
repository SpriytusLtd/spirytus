require 'rails_helper'

RSpec.describe Alcoholic, type: :model do
  describe 'with validation' do
    let(:alcoholic) { Alcoholic.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = '密造酒'
      hash[:item1] = 'うまい'
      hash[:item2] = 'まずい'
      hash[:item3] = 'つよい'
      hash[:item4] = 'よわい'
      hash[:item5] = 'すごい'
      hash[:item6] = 'やばい'
      hash
    end
    shared_examples 'be valid' do
      it { expect(alcoholic).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(alcoholic).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
      context 'when item3 is not present' do
        before do
          alcoholic.item3 = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when item4 is not present' do
        before do
          alcoholic.item4 = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when item5 is not present' do
        before do
          alcoholic.item5 = nil
        end
        it_behaves_like 'be valid'
      end
      context 'when item6 is not present' do
        before do
          alcoholic.item6 = nil
        end
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          alcoholic.name = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when item1 is not present' do
        before do
          alcoholic.item1 = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when item2 is not present' do
        before do
          alcoholic.item2 = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.name = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when item1 is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.item1 = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when item2 is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.item2 = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when item3 is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.item3 = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when item4 is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.item4 = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when item5 is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.item5 = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when item6 is over limit' do
        before do
          str101 = 'n' * 101
          alcoholic.item6 = str101
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
