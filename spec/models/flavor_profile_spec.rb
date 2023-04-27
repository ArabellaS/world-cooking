require "rails_helper"

RSpec.describe FlavorProfile, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:flavor_profile, saltiness: nil)).not_to be_valid
        expect(build(:flavor_profile, sweetness: nil)).not_to be_valid
        expect(build(:flavor_profile, savoriness: nil)).not_to be_valid
        expect(build(:flavor_profile, sourness: nil)).not_to be_valid
        expect(build(:flavor_profile, spiciness: nil)).not_to be_valid
        expect(build(:flavor_profile, bitterness: nil)).not_to be_valid
        expect(build(:flavor_profile, fattiness: nil)).not_to be_valid
        expect(build(:flavor_profile, fattiness: -1)).not_to be_valid
        expect(build(:flavor_profile, fattiness: 6)).not_to be_valid
      end
    end
    context "when valid" do
      it "factory doesn't raises an error" do
        expect(build(:flavor_profile)).to be_valid
      end
      it "factory doesn't raises an error when given a place" do
        user = create(:user)
        expect(create(:flavor_profile)).to be_valid
        expect(FlavorProfile.first.user).to eq(user)
      end
    end
  end
end
