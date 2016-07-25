require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    context "on a new user" do
      it "should not be valid without a password" do
        user = User.new password: nil, password_confirmation: nil, email: 'email@email.com'
        expect(user).to_not be_valid
      end

      it "should not be valid with a short password" do
        user = User.new password: 'short', password_confirmation: 'short', email: 'email@email.com'
        expect(user).to_not be_valid
      end

      it "should not be valid with a confirmation mismatch" do
        user = User.new password: 'short', password_confirmation: 'long', email: 'email@email.com'
        expect(user).to_not be_valid
      end

      it 'should not be valid with an invalid email' do
        user = User.new password: 'password', password_confirmation: 'password', email: 'email@email'
        expect(user).to_not be_valid
      end

      it 'should not be valid with an email already in use' do
        user1 = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
        expect(user1).to be_valid
        user2 = User.new    password: 'password', password_confirmation: 'password', email: user1.email
        expect(user2).to_not be_valid
      end
    end

    context "on an existing user" do
      let(:user) do
        User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      end

      it "should be valid with no changes" do
        expect(user).to be_valid
      end

      it "should not be valid with an empty password" do
        user.password = user.password_confirmation = ""
        expect(user).to_not be_valid
      end

      it "should be valid with a new (valid) password" do
        user.password = user.password_confirmation = "new password"
        expect(user).to be_valid
      end
    end
  end
end
