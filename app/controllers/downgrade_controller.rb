class DowngradeController < ApplicationController
  def update
    current_user.update(role: "standard")
    flash[:notice] = "Your account has been dongraded to a standard account. Your private wikis are now public"
    redicrect_to current_user
  end
end
