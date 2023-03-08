require "open-uri"
require "nokogiri"

class ScrapeAllrecipesService
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    html = URI.open("https://www.allrecipes.com/search?q=#{@ingredient}").read
    # 1. Parse HTML
    doc = Nokogiri::HTML.parse(html, nil, "utf-8")
    results = []
    # 2. Search the Nokogiri document by identifying the cards
    doc.search(".mntl-card-list-items.card").each do |element|
      # 3 Go through actual recipes and not blog articles - recipes are the cards with a rating
      unless element.search(".recipe-card-meta__rating-count-number").empty?
        # 4. Create recipe and store it in results
        name = element.search(".card__title-text").text.strip
        # rating = element.search(".icon.icon-star").count + element.search(".icon.icon-star-half").count * 0.5
        details_url = element.attribute("href").value
        details_doc = Nokogiri::HTML.parse(URI.open(details_url).read, nil, "utf-8")
        content = details_doc.search("p").first.text.strip
        # 5. Assign a default value to prep_time, in case it's not specified
        # prep_time = "no time provided"
        # details_doc.search(".mntl-recipe-details__item").each do |prep_details|
        #   if prep_details.search('.mntl-recipe-details__label:contains("Prep Time:")').any?
        #     prep_time = prep_details.search(".mntl-recipe-details__value").text.strip
        #   end
        # end
        # 6. Create a recipe instance and append it to our results array.
        # results << Recipe.new(content: content, place: Place.first)
        results << content
      end
    end
    # 7. Select the first 5 recipes at the end when we're sure we have built recipes instances (no articles)
    results.first(5)
  end
end
