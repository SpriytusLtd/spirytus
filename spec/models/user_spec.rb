require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'with validation' do
    let(:user) { User.new(params) }
    let(:params) do
      hash = {}
      hash[:name] = 'user'
      hash[:email] = 'user@example.com'
      hash[:password] = 'password'
      hash
    end
    shared_examples 'be valid' do
      it { expect(user).to be_valid }
    end
    shared_examples 'not be valid' do
      it { expect(user).not_to be_valid }
    end
    describe 'with true case' do
      context 'when all present' do
        it_behaves_like 'be valid'
      end
    end
    describe 'with present' do
      context 'when name is not present' do
        before do
          user.name = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when email is not present' do
        before do
          user.email = nil
        end
        it_behaves_like 'not be valid'
      end
      context 'when password is not present' do
        before do
          user.password = nil
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with maximum length' do
      context 'when name is over limit' do
        before do
          str21 = 'n' * 21
          user.name = str21
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with minimum length' do
      context 'when name is too short' do
        before do
          str7 = 'n' * 7
          user.password = str7
        end
        it_behaves_like 'not be valid'
      end
    end
    describe 'with pattern' do
      context 'when email is not email-pattern' do
        before do
          but_email = 'user@example'
          user.email = but_email
        end
        it_behaves_like 'not be valid'
      end
    end
  end
end
