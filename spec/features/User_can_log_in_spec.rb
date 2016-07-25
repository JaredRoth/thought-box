require "rails_helper"

feature "User can log in" do
  context "when they visit the root and are unauthenticated" do
    it "redirects them to the log-in/sign-up page" do
      visit root_path

      expect(current_path).to eq(signin_path)
    end

    context "when they click on Sign Up" do
      it "redirects them to a sign-up form" do
        visit signin_path

        click_on "Sign Up"

        expect(current_path).to eq(new_user_path)
      end

      it "gives email, password, and password confirmation fields and logs the user in and redirects them to the root" do
        visit new_user_path

        fill_in "E-Mail", with: "email@email.com"
        fill_in "Password", with: "password"
        fill_in "Password Confirmation", with: "password"
        click_on "Create Account"
      end
    end

    context "when they click on Sign In" do
      it "redirects to the sign-in form and allows existing users to sign in" do
        user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
        visit signin_path

        click_on "Sign In"

        expect(current_path).to eq(login_path)
        fill_in "E-Mail", with: user.email
        fill_in "Password", with: user.password
        click_on "Sign In"

        expect(current_path).to eq(root_path)
      end
    end
  end
end
