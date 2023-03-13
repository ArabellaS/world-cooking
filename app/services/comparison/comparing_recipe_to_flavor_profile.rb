class Comparison::

  def initialize
    @flavor_profile = flavor_profile
    @flavor_profile.user = current_user
    @recipe = recipe
  end

  def compare
  end
end
