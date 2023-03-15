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

end
