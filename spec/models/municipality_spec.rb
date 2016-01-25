require 'rails_helper'

RSpec.describe Municipality, type: :model do
  describe 'with validation' do
    let(:municipality) { Municipality.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = 'インスマス'
      hash
    end
    shared_examples 'be valid' do
      it { expect(municipality).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(municipality).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          municipality.name = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is over limit' do
        before do
          str101 = 'n' * 101
          municipality.name = str101
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
