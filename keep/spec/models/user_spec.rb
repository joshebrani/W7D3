require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: "asdf", password: "1234567")}
  

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should allow_value(nil).for(:password)}

  it "creates password_digest when password is given" do
    expect(user.password_digest).to_not be_nil
  end

end
