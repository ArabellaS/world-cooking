require "open-uri"
require "nokogiri"

class Scraper::RecipesByPlaceService
  def initialize(recipe)
    @recipe = recipe
  end

  def self.call(recipe)
    new(recipe).perform
  end

  def perform

    url = "https://en.wikipedia.org/wiki/#{formatted(@recipe[:name])}"

    begin
      response = URI.open(url)
      puts "Doing some scrapping at #{url}..."
    rescue
      puts "The request for a page at #{url} timed out...exiting."
      return false
    end

    html = response.read

    doc = Nokogiri::HTML.parse(html, nil, "utf-8")

    # doc.search(".infobox_v2.noarchive").each do |element|
    doc.search(".infobox.hrecipe.adr").each do |element|

      country = element.search(".infobox-data.country-name").text.strip
      region = element.search(".infobox-data.region").text.strip

      next unless country.present? && region.present?

      ## Italy ##
      region = "Campania, Calabria" if region == "CampaniaSicily  Apulia  Calabria"
      region = "Veneto Friuli Venezia Giulia" if region == "VenetoFriuli Venezia Giulia"
      region = "Prato (Tuscany)" if region == "Prato (Tuscany), Spain, Central America, the Philippines"

      ## India ##
      country = "India" if country == "Indian subcontinent"
      region = "North India" if region == "North India, Indian subcontinent"
      region = "North India" if region == "Northern region of the Indian subcontinent"
      region = "Delhi" if region == "Delhi[1][2][3][4][5][6][7]"

      ## Japan ##
      country = "Canada" if country == "Canada, United States"

      place = Place.find_or_create_by(country: country, region: region)

      @recipe.place = place
      @recipe.save

    end
    return true
  end

  private

  def enlever_contenu_entre_parentheses(phrase)
    phrase.gsub(/\(.*?\)/, '')
  end

  def formatted(phrase)
    remplacer_espace(mettre_en_minuscule_sauf_premiere_lettre(enlever_contenu_entre_parentheses(phrase)))
  end

  def remplacer_espace(phrase)
    phrase.strip.gsub(" ", "%20")
  end

  def mettre_en_minuscule_sauf_premiere_lettre(chaine)
    chaine[0] + chaine[1..-1].downcase
  end

  def dernier_mot(phrase)
    phrase.split.last
  end
end
