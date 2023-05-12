require "rails_helper"

RSpec.describe RecipeElement, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:recipe_element, amount: nil)).not_to be_valid
        expect(build(:recipe_element, unit: nil)).not_to be_valid
      end
    end
    context "when valid" do
      it "factory doesn't raises an error" do
        expect(build(:recipe_element)).to be_valid
      end
      it "factory doesn't raises an error when given a recipe" do
        temp_recipe = create(:recipe)
        expect(create(:recipe_element)).to be_valid
        expect(RecipeElement.first.recipe).to eq(temp_recipe)
      end
      it "factory doesn't raises an error when given an ingredient" do
        temp_ingredient = create(:ingredient)
        expect(create(:recipe_element)).to be_valid
        expect(RecipeElement.first.ingredient).to eq(temp_ingredient)
      end
    end
  end
end
