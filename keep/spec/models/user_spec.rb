require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: "Josh", password: "1234567")}

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should allow_value(nil).for(:password) }
  
  it "creates password_digest when password is given" do
    expect(user.password_digest).to_not be_nil
  end
  
  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "is_password?" do
    it "matches the password" do
      expect(user.is_password?("1234567")).to be true
    end
    it "returns false if password doesn't match" do
      expect(user.is_password?("1234568")).to be false
    end
  end

  describe "::find_by_credentials" do
    it "returns user when found" do
      user.save!
      expect(User.find_by_credentials("Josh", "1234567")).to eq(user)
    end
    it "returns nil when not found" do
      user.save!
      expect(User.find_by_credentials("Joh", "12345678")).to eq(nil)
    end
  end

  describe "reset_session_token!" do
    it "resets session_token" do
      user.valid?
      old_session_token = user.session_token
      new_session_token = user.reset_session_token!
      expect(old_session_token).to_not eq(new_session_token)
    end
  end
end