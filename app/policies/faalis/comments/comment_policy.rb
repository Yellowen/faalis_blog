class Faalis::Comments::CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
