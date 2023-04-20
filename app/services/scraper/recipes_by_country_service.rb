require "open-uri"
require "nokogiri"

class Scraper::RecipesByCountryService
  def initialize(country)
    @country = country
    @place = Place.find_or_create_by(country: @country)
    @cuisine = {
      'France' => {name: 'french', continent: 'european', code: 721},
      'Italy' => {name: 'italian', continent: 'european', code: 723},
      'India' => {name: 'indian', continent: 'asian', code: 233},
      'Japan' => {name: 'japanese', continent: 'asian', code: 699}
    }
  end

  def self.call(country)
    new(country).perform
  end

  def perform
    url = "https://www.allrecipes.com/recipes/#{@cuisine[@country][:code]}/world-cuisine/#{@cuisine[@country][:continent]}/#{@cuisine[@country][:name]}/"
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html, nil, "utf-8")

    doc.search(".mntl-card-list-items.card").each do |element|

      unless element.search(".recipe-card-meta__rating-count-number").empty?
        name = element.search(".card__title-text").text.strip

        details_url = element.attribute("href").value

        ## photo : ##
        photo_url = element.search('img').first.attributes["data-src"].value

        # begin
          photo = URI.open(photo_url)
          puts "Add photo to data at #{photo_url}..."
        # rescue
        #   puts "The request for a page at #{photo_url} timed out...exiting."
        #   return false
        # end

        details_doc = Nokogiri::HTML.parse(URI.open(details_url).read, nil, "utf-8")

        ######## Recipe ########

        directions = details_doc.search('.comp.recipe__steps.mntl-block')[0]

        steps = directions.search('li')

        content = ""

        steps.each_with_index do |step, index|
          para = step.search('p')[0]

          content += "STEP #{index + 1}\n"

          content += para.text.strip
        end

        recipe = Recipe.create(name: name, content: content, place: @place)
        ## photo : ##
        recipe.photo.attach(io: photo, filename: "#{recipe.name}_photo", content_type: 'image/*')

        ######## Ingredient & Quantity ########

        directions_ingre = details_doc.search('.comp.mntl-structured-ingredients')[0]

        steps_ingre = directions_ingre.search('li')

        steps_ingre.each_with_index do |step, index|
          name = step.search('span[data-ingredient-name="true"]')[0].try(:text).try(:strip)
          unit = step.search('span[data-ingredient-unit="true"]')[0].try(:text).try(:strip)
          amount = step.search('span[data-ingredient-quantity="true"]')[0].try(:text).try(:strip)

          # p name, unit, amount

          next unless name.present?

          ingredient = Ingredient.find_or_create_by(name: name)

          ingredient.places << @place

          Quantity.create(unit: unit, amount: amount, ingredient: ingredient, recipe: recipe)
        end
      end

    end
    return true
  end
end
