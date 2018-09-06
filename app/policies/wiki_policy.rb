class WikiPolicy < ApplicationPolicy

  def index?
    true
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
