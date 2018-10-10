class WikiPolicy < ApplicationPolicy

  attr_reader :user, :wiki
  def initialize(user, wiki)
   @user = user
   @wiki = wiki
 end

  def index?
    true
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    user.present? && user == wiki.user
  end

  def destroy?
    user.present? && user == wiki.user
  end

  def update?
    user.present? && user == wiki.user
  end
end
