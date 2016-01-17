require 'rails_helper'

RSpec.describe Brewer, type: :model do
  describe 'with validation' do
    let(:brewer) { Brewer.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = '1920代アメリカ'
      hash
    end
    shared_examples 'be valid' do
      it { expect(brewer).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(brewer).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      before do
        brewer.name = nil
      end
      it_behaves_like 'not be valid'
    end
    describe 'with maximum length' do
      before do
        str101 = 'n' * 101
        brewer.name = str101
      end
      it_behaves_like 'not be valid'
    end
  end
end
