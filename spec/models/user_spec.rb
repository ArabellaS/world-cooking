require "rails_helper"

RSpec.describe User, :type => :model do
  describe "Check validation" do
    context "when invalid" do
      it "factory raises an error" do
        expect(build(:user, email: nil)).not_to be_valid
      end
    end
    context "when valid" do
      it "factory doesn't raises an error" do
        expect(build(:user)).to be_valid
      end
    end
  end
end
