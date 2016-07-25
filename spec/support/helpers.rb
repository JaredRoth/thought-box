module Helpers
  def sign_in(user)
    visit login_path
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign In"
  end
end
