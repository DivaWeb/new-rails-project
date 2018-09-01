class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :wiki

    def initialze(user, wiki)
      @user = user
      @wiki = wiki
    end
    def resolve
      scope.all
    else
      scope.where(published: true)
    end
    end
  end
