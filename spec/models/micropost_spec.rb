require "rails_helper"

RSpec.describe Micropost, type: :model do

  describe Micropost do

    before(:each) do
      @user = FactoryGirl.build :user
      @post = {content: "lorem ipsum"}
    end

    it "should create a new instance with valid attributes" do
      @user.microposts.create!(@post)
    end

    describe "user associations" do

      before(:each) do
        @micropost = @user.microposts.create(@post)
      end

      it "should have a user attribute" do
        @micropost.should respond_to(:user)
      end

      it "should have the right associated user" do
        @micropost.user_id.should == @user.id
        @micropost.user.should == @user
      end
    end

    describe "validations" do

      it "should have a user id" do
        Micropost.new(@post).should_not be_valid
      end

      it "should require nonblank content" do
        @user.microposts.build(content: " ").should_not be_valid
      end

      it "should reject long content" do
        @user.microposts.build(content: "a" * 100).should_not be_valid
      end
    end
  end
end
