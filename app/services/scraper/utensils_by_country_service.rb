require "open-uri"
require "nokogiri"

class Scraper::UtensilsByCountryService
  def initialize(country)
    @country = country
    @place = Place.find_or_create_by(country: @country)
    @cuisine = {
      'France' => {url: 'https://french.kwiziq.com/learn/theme/2167325'}
    }
  end

  def self.call(country)
    new(country).perform
  end

  def perform
    url = @cuisine[@country][:url]
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html, nil, "utf-8")

    doc.search(".padding-0.callout-body").each do |element|

      steps = element.search(".txt--lang-native")

      steps.each_with_index do |step, index|

        utensil_name = step.text.strip

        utensil = Utensil.find_or_create_by(name: utensil_name)
        utensil.places << @place
      end

    end

  return true
  end
  
end

