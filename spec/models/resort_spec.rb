require 'rails_helper'

RSpec.describe Resort, type: :model do
  describe 'with validation' do
    let(:resort) { Resort.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = 'インスマス'
      hash[:address] = 'アメリカ合衆国マサチューセッツ州'
      hash[:detail] = 'お酒が有名。'
      hash
    end
    shared_examples 'be valid' do
      it { expect(resort).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(resort).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
      context 'when address is not present' do
        before do
          resort.address = nil
        end
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          resort.name = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when detail is not present' do
        before do
          resort.detail = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is over limit' do
        before do
          str101 = 'n' * 101
          resort.name = str101
        end
        it_behaves_like 'not be valid'
      end
      context 'when address is over limit' do
        before do
          str201 = 'n' * 201
          resort.address = str201
        end
        it_behaves_like 'not be valid'
      end
      context 'when detail is over limit' do
        before do
          str1001 = 'n' * 1001
          resort.detail = str1001
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
