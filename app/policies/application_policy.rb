class ApplicationPolicy
  attr_reader :request_wiki :user, :record

  def initialize(user, record)
    @wiki = wiki
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)

      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  class PostPolicy
    attr_reader :user, :PostPolicy

    def initialize(user, wiki)
      @user = user
      @wiki = wiki
    end

    def update?
      user.admin? or not wiki.published?
    end
  end



end
