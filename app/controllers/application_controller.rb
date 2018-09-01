class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  def pundit_user
    user.new(current_user, current_wiki)
  end


end
