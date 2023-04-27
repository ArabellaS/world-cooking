require "rails_helper"


RSpec.describe Ingredient, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:ingredient, name: nil)).not_to be_valid
      end
    end
    context "when valid" do
      it "factory doesn't raises an error" do
        expect(build(:ingredient)).to be_valid
      end
    end
  end
end
