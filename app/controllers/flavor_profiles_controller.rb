class FlavorProfilesController < ApplicationController

  def new
    @flavor_profile = FlavorProfile.new
    @flavor_profile.user = current_user
  end

  def create
    @flavor_profile = FlavorProfile.new(flavor_profile_params)
    @flavor_profile.user = current_user
    if @flavor_profile.save!
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @flavor_profile = FlavorProfile.find(params[:id])
  end

  def update
    @flavor_profile = FlavorProfile.find(params[:id])
    if @flavor_profile.update(flavor_profile_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def flavor_profile_params
    params.require(:flavor_profile).permit(:saltiness, :sourness, :savoriness, :sweetness, :bitterness, :spiciness)
  end
end
