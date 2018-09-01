class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_action :verify_authorized, except: :index
  before_action :authenticate_user!

end
