require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user = User.new(firstName: "John", lastName: "Mark", email: "email@gmail.com", password: "12345678", password_confirmation: "12345678")
    end
    it "should not valid without first name" do
      @user.firstName = nil
      expect(@user).to_not be_valid
    end
    it "should not valid without last name" do
      @user.lastName = nil
      expect(@user).to_not be_valid
    end
    it "should not valid without email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "should not valid without password " do
      @user.password = nil
      expect(@user).to_not be_valid
    end
    it "should not valid without password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
    it "should not be valid if password and password confirmation do not match" do
      @user.password_confirmation = "123"
      expect(@user).to_not be_valid
    end
    it "should not be valid if email already exists" do
      @user2 = User.create(firstName: "Sarah", lastName: "Mark", email: "EMAIL@GMAIL.COM", password: "12345678", password_confirmation: "12345678")
      expect(@user).to_not be_valid
    end
    it "should not be valid if password length<6" do
      @user.password = "123"
      expect(@user).to_not be_valid
    end
    it "should be valid with valid parameters" do
      expect(@user).to be_valid
    end
  end
end
