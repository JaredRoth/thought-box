module Helpers
  def sign_in(user)
    visit login_path
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign In"
  end

  def sign_up(user)
    visit new_user_path
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password Confirmation", with: user.password
    click_on "Create Account"
  end

  def create_link
    visit root_path
    fill_in "Title", with: "Test the Title"
    fill_in "URL", with: "http://www.google.com"
    click_on "Submit Link"
  end

  def create_links
    3.times do |num|
      fill_in "Title", with: "Test the Title #{num}"
      fill_in "URL", with: "http://www.google.com"
      click_on "Submit Link"
    end
  end
end
