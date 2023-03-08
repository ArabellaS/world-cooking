require "open-uri"
require "nokogiri"

class Scraper::RecipesByCountryService
  def initialize(country)
    @country = country
    @place = Place.find_or_create_by(country: @country)
    @cuisine = {
      'France' => {name: 'french', continent: 'european', code: 721},
      'Italy' => {name: 'italian', continent: 'european', code: 723},
      'India' => {name: 'indian', continent: 'asian', code: 233}
    }
  end

  def self.call(country)
    new(country).perform
  end

  def perform
    url = "https://www.allrecipes.com/recipes/#{@cuisine[@country][:code]}/world-cuisine/#{@cuisine[@country][:continent]}/#{@cuisine[@country][:name]}/"
    p url
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html, nil, "utf-8")

    doc.search(".mntl-card-list-items.card").each do |element|

      unless element.search(".recipe-card-meta__rating-count-number").empty?
        name = element.search(".card__title-text").text.strip

        details_url = element.attribute("href").value
        details_doc = Nokogiri::HTML.parse(URI.open(details_url).read, nil, "utf-8")

        # directions = details_doc.search('.comp.recipe__steps.mntl-block')[0]

        # steps = directions.search('li')

        # content = ""

        # steps.each_with_index do |step, index|
        #   para = step.search('p')[0]

        #   content += "STEP #{index + 1}\n"

        #   content += para.text.strip
        # end

        # Recipe.create(name: name, content: content, place: @place)

        directions_ingre = details_doc.search('.comp.mntl-structured-ingredients')[0]
        
        steps_ingre = directions_ingre.search('li')

        steps_ingre.each_with_index do |step, index|
          name = step.search('span[data-ingredient-name="true"]')[0].text.strip
          unit = step.search('span[data-ingredient-unit="true"]')[0].text.strip
          amount = step.search('span[data-ingredient-quantity="true"]')[0].text.strip

          p name, unit, amount

          # next if name.exists? && unit.exists? && amount.exists?

          # if Ingredient.where(name: name).exists?
          #   ingredient = Ingredient.where(name: name)
          # else
          #   ingredient = Ingredient.create(name: name)
          # end
          # ## Comment accéder à la recipe ?
          # Quantity.create(unit: unit, amount: amount, ingredient: ingredient)
        end

      end
    end
  end
end

