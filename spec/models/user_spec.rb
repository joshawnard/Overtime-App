require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "creation" do
    it "cannot be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end

  describe "custom name methods" do
    it "has a full anme method that combines first and last name" do
      expect(@user.full_name).to eq("SNOW, JON")
    end
  end
end
