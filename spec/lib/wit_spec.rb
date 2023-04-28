# DOESNT Work yet


# require 'rails_helper'
# require 'wit'
# require_relative '../../lib/wit.rb'

# RSpec.describe "Wit" do
#   describe "handle_wit_message" do
#     it "returns a response for a polite message" do
#       allow_any_instance_of(Wit).to receive(:message).and_return({ 'intents' => [{'name' => 'wit_politeness'}], 'entities' => {} })
#       expect(handle_wit_message("Hi, how are you?")).to eq("hi guy !")
#     end

#     it "returns a list of recipes for a country" do
#       allow_any_instance_of(Wit).to receive(:message).and_return({ 'intents' => [{'name' => 'wit_country'}], 'entities' => { 'wit_country:wit_country' => [{ 'value' => 'France' }] } })
#       expect(handle_wit_message("What can I cook from France?").size).to be <= 4
#     end

#     it "returns a list of recipes for an ingredient" do
#       FactoryBot.create(:recipe, name: 'Recipe 1', ingredients: [FactoryBot.create(:ingredient, name: 'tomato')])
#       allow_any_instance_of(Wit).to receive(:message).and_return({ 'intents' => [{'name' => 'wit_ingredient'}], 'entities' => { 'wit_ingredient:wit_ingredient' => [{ 'value' => 'tomato' }] } })
#       expect(handle_wit_message("What can I cook with tomato?").size).to be <= 4
#     end
#   end
# end
