require "rails_helper"

RSpec.describe Place, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:place, country: nil, lng: nil, lat:nil)).not_to be_valid
      end
      it "Check for a valid factory" do
        expect(build(:place)).to be_valid
      end
    end
  end
end
