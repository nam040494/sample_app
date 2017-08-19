require "rails_helper"

RSpec.describe SessionsHelper, type: :helper do
  describe "#current_user" do
    let :user {FactoryGirl.create :user}

    context "current_user returns right user when session is nil" do
      subject {current_user}
      before do
        remember user
      end
      it {expect(:user).to eq :user}
    end

    context "current_user returns nil when remember digest is wrong" do
      subject {current_user}
      before do
        remember user
        user.remember_digest = User.digest User.new_token
        user.save
      end
      it {is_expected.to eq nil}
    end
  end
end
