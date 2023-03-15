class FlavorProfilesController < ApplicationController

  def new
    @flavor_profile = FlavorProfile.new
    @flavor_profile.user = current_user
  end

  def create
    @flavor_profile = FlavorProfile.new(flavor_profile_params)
    @flavor_profile.user = current_user
    if @flavor_profile.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @flavor_profile = FlavorProfile.find(params[:user_id])
    @flavor_profile.update
  end

  private

  def flavor_profile_params
    params.require(:flavor_profile).permit(:saltiness, :sourness, :savoriness, :sweetness, :bitterness, :spiciness)
  end
end
