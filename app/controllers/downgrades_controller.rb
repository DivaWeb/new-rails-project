class DowngradesController < ApplicationController
  def update
    current_user.update(role: "standard")

    current_user.wikis.each do |pub|
      pub.update_attribute(:private, false)
    end

    re = Stripe::Refund.create( charge: "ch_1APv2RFuNOgwvE4WHK9DBrQy" )

    flash[:notice] = "Your account has been dongraded to a standard account. Your private wikis are now public"
    redirect_to root_path
  end

  def index
  end
end
