class BookPolicy < ApplicationPolicy
  def create?
    user.present? && user.user_type == 'librarian'
  end

  def update?
    user.present? && user.user_type == 'librarian'
  end

  def destroy?
    user.present? && user.user_type == 'librarian'
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
