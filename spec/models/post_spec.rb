require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @user = User.create(
        first_name: "Jon",
        last_name: "Snow",
        email: "test1@test.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf",
      )
      @post = Post.create(date: Date.today, rationale: "anything", user_id: @user.id)

      login_as(@user, :scope => :user)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date or rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).not_to be_valid
    end
  end
end
