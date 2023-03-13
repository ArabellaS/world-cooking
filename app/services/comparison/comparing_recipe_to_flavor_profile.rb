class Comparison::ComparingRecipeToFlavorProfile

  def initialize(flavor_profile, recipe)
    @flavor_profile = flavor_profile
    @recipe = recipe
  end

  def self.call(flavor_profile, recipe)
    new(flavor_profile, recipe).perform
  end

  def perform
    keys = ['saltiness', 'bitterness', 'savoriness', 'sourness', 'spiciness', 'sweetness', 'fattiness']

    keys.each do |key|
      grade = (@flavor_profile[key] - @recipe[key]) / 10

      @flavor_profile[key] -= grade
    end

    @flavor_profile.save
  end
end
