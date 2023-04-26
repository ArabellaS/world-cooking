require "rails_helper"

RSpec.describe User, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "raises an error" do
        expect(build(:user, email: nil)).not_to be_valid
      end
      it "Check for a valid factory" do
        expect(build(:user)).to be_valid
      end
    end
  end
end
