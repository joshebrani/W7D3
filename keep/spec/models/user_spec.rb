require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do 
    FactoryBot.build(:user, username: "Josh", password: "1234567")
  end
end
