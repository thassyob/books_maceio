# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavoriteBooksPolicy do
  subject { described_class }

  permissions :index?, :create?, :destroy? do
    context 'when the user present and user type reader' do
      it 'should permit' do
        user = create(:user, user_type: 'reader')

        expect(subject).to permit(user)
      end
    end
  end

  permissions :index?, :create?, :destroy? do
    context 'when user is not reader' do
      it 'should not permit' do
        user = create(:user, user_type: 'librarian')

        expect(subject).not_to permit(user)
      end
    end
  end
end
