require "rails_helper"

feature "User can log out" do
  context "when they are authenticated" do
    it "they see a link to log out that logs them out and redirects to login" do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'

      sign_in(user)

      click_on "Sign Out"

      expect(current_path).to eq(signin_path)
    end
  end
end
