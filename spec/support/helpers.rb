module Helpers
  def sign_in(user)
    visit login_path
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign In"
  end

  def create_link
    visit root_path
    fill_in "Title", with: "Test the Title"
    fill_in "URL", with: "http://www.google.com"
    click_on "Submit Link"
  end
end
