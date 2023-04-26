RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
end

def login_user
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user, email: "bot@test.com")
    sign_in user
  end
end

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    admin = FactoryBot.create(:admin_user, email: "bot@test.com", password: "password", password_confirmation: 'password')
    sign_in admin
  end
end
