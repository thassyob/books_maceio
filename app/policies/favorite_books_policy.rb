class FavoriteBooksPolicy < ApplicationPolicy
  def index?
    user.present? && user.user_type == 'reader'
  end

  def create?
    user.present? && user.user_type == 'reader'
  end

  def destroy?
    user.present? && user.user_type == 'reader'
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
