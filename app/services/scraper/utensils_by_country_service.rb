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

    if @country == 'France'

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

    else

      if @country == 'Italy'

        utensils = [ 
          "Knives", 
          "A Garlic Press", 
          "Spoons: Wooden & Slotted",
          "Colander: Scolapasta",
          "A Cheese Grater",
          "A Pasta Machine",
          "A Pasta Drying Rack or Pasta Stand",
          "A Ravioli Cutter, Press or Stamp"
        ]

      elsif @country == 'India'

        utensils = [ 
          "Uruli", 
          "Murukku/Idiyappam Ural", 
          "Appe Pan",
          "Idli Cooker",
          "Ammikallu or Silbatta",
          "Clay Meen Chatti",
          "Kalchatti",
          "Brass Coffee Filter",
          "Kuzhi Karandi",
          "Soapstone Dosa Tawa"
        ]

      else #=> Japan
        
        utensils = [ 
          "Fine Mesh Skimmer",
          "Miso Strainer & Miso Muddler",
          "Suribachi and Surikogi",
          "Ceramic Grater",
          "Otoshibuta/ Drop Lid",
          "Hangiri/ Sushi Oke",
          "Bamboo Sushi Mat",
          "Long Chopsticks"
        ]

      end

      utensils.each_with_index do |utensil, index|
        utensil = Utensil.find_or_create_by(name: utensil)
        utensil.places << @place
      end
    
    end

  return true
  end
  
end

