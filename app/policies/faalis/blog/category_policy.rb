module Faalis::Blog
  class Blog::CategoryPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
