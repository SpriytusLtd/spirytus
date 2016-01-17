require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'with validation' do
    let(:store) { Store.new(params) }
    let(:params) do
      hash = {}
      hash[:email] = 'true_store@example.com'
      hash[:password] = '01234567'
      hash[:name] = 'true store'
      hash[:address] = '高知県香美市土佐山田町宮ノ口185'
      hash[:phone_number] = '0120-00-0000'
      hash[:budget] = 3000
      hash[:detail] = 'This store is true.'
      hash
    end
    shared_examples 'not be valid' do
      it { expect(store).not_to be_valid }
    end
    context 'when true case' do
      it 'be valid' do
        expect(store).to be_valid
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          store.name = ''
        end
        it_behaves_like 'not be valid'
      end
      context 'when address is not present' do
        before do
          store.address = ''
        end
        it_behaves_like 'not be valid'
      end
      context 'when phone_number is not present' do
        before do
          store.phone_number = ''
        end
        it_behaves_like 'not be valid'
      end
      context 'when budget is not present' do
        before do
          store.budget = ''
        end
        it_behaves_like 'not be valid'
      end
      context 'when detail is not present' do
        before do
          store.detail = ''
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is not present' do
        before do
          str51 = 'n' * 51
          store.name = str51
        end
        it_behaves_like 'not be valid'
      end
      context 'when addless is not present' do
        before do
          str201 = 'n' * 201
          store.address = str201
        end
        it_behaves_like 'not be valid'
      end
      context 'when phone_number is not present' do
        before do
          str21 = 'n' * 21
          store.phone_number = str21
        end
        it_behaves_like 'not be valid'
      end
      context 'when budget is not present' do
        before do
          digit11 = 10**10
          store.budget = digit11
        end
        it_behaves_like 'not be valid'
      end
      context 'when detail is not present' do
        before do
          str2001 = 'n' * 2001
          store.detail = str2001
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end