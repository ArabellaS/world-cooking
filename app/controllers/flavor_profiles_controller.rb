class FlavorProfilesController < ApplicationController


  def new
    @flavor_profile = FlavorProfile.new
    @flavor_profile.user = current_user
  end

  def save
    @flavor_profile = FlavorProfile.new
    @flavor_profile.user = current_user
    @flavor_profile.save
  end

  def edit
    @flavor_profile = FlavorProfile.find(params[:user_id])
    @flavor_profile.update
  end

end
