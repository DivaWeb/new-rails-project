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
end
