require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "sign up" do

    it "the to field has a users email address" do
      user = User.create(email: "b@example.com")
      mailer = UserMailer.sign_up(user.id)
      # puts mailer.methods.sort.inspect
      expect(mailer.to).to include "b@example.com"
      # expect(mailer.to.first).to eq ""
    end

    it "includes the username within the email body" do
      user = User.create(email: "b@example.com")
      mailer = UserMailer.sign_up(user.id)
      expect(mailer.body.to_s).to match(/Hello b@example.com/)
    end
  end
end
