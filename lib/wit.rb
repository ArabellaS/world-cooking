require 'wit'

def handle_wit_message(message)
  client = Wit.new(access_token: ENV['WIT_ACCESS_TOKEN'])
  response = client.message(message)
  # Process the response and use it to query your database
  # @country = country
  # @all_recipes = {
  #   'France' => Recipe.where(country: @country).to_a,
  #   'Italy' => Recipe.where(country: @country).to_a,
  #   'Japan' => Recipe.where(country: @country).to_a,
  # }
  # Return the result of the query
  p response
  # intent = response['intents'][0]['name']  # Extract the intent from the response
  entities = response['entities']      # Extract the entities from the response
  
  intent = entities.keys[0].split(':')[0]

  case intent
  when 'wit_politeness'
    # Construct a database query based on the entities
    return 'hi guy !'
  when 'wit_country'
    value = entities["#{intent}:#{intent}"][-1]['value']
    Recipe.joins(:place).where('places.country = ?', value).limit(5)
  when 'wit_category'
    value = entities["#{intent}:#{intent}"][-1]['value']
    Recipe.joins(:categories).where('categories.content ILIKE ?', "%#{value}%").limit(5)
  when 'wit_ingredient'
    value = entities["#{intent}:#{intent}"][-1]['value']
    Recipe.joins(:ingredients).where('ingredients.name ILIKE ?', "%#{value}%").limit(5)
  end
end
