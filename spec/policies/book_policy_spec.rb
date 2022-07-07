# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookPolicy do
  subject { described_class }

  permissions :create?, :update?, :destroy? do
    context 'when the user present and user type librarian' do
      it 'should permit' do
        user = create(:user, user_type: 'librarian')

        expect(subject).to permit(user)
      end
    end
  end

  permissions :create?, :update?, :destroy? do
    context 'when user is not librarian' do
      it 'should not permit' do
        user = create(:user, user_type: 'reader')

        expect(subject).not_to permit(user)
      end
    end
  end
end
