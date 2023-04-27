require "rails_helper"

RSpec.describe Quantity, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:quantity, amount: nil)).not_to be_valid
        expect(build(:quantity, unit: nil)).not_to be_valid
      end
    end
    context "when valid" do
      it "factory doesn't raises an error" do
        expect(build(:quantity)).to be_valid
      end
      it "factory doesn't raises an error when given a recipe" do
        temp_recipe = create(:recipe)
        expect(create(:quantity)).to be_valid
        expect(Quantity.first.recipe).to eq(temp_recipe)
      end
      it "factory doesn't raises an error when given an ingredient" do
        temp_ingredient = create(:ingredient)
        expect(create(:quantity)).to be_valid
        expect(Quantity.first.ingredient).to eq(temp_ingredient)
      end
    end
  end
end
