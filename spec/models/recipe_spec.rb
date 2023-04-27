require "rails_helper"

RSpec.describe Recipe, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:recipe, name: nil)).not_to be_valid
        expect(build(:recipe, content: nil)).not_to be_valid
        expect(build(:recipe, saltiness: nil)).not_to be_valid
        expect(build(:recipe, sweetness: nil)).not_to be_valid
        expect(build(:recipe, savoriness: nil)).not_to be_valid
        expect(build(:recipe, sourness: nil)).not_to be_valid
        expect(build(:recipe, spiciness: nil)).not_to be_valid
        expect(build(:recipe, bitterness: nil)).not_to be_valid
        expect(build(:recipe, fattiness: nil)).not_to be_valid
      end
    end
    context "when valid" do
      it "factory doesn't raises an error" do
        expect(build(:recipe)).to be_valid
      end
      it "factory doesn't raises an error when given a place" do
        temp_place = create(:place)
        expect(create(:recipe)).to be_valid
        expect(Recipe.first.place).to eq(temp_place)
      end
    end
  end
end
