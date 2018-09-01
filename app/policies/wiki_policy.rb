class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialze(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      scope.all
    else
      scope.where(published: true)
    end
    end
  end
end
