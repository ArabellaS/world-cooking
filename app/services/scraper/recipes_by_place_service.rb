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
    p url
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html, nil, "utf-8")

    doc.search(".infobox_v2.noarchive").each do |element|

      p element

    end
    return true
  end

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

# Scraper::RecipesByPlaceService.call(Recipe)
