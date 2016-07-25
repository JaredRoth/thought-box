require "rails_helper"

feature "User can submit a link" do
  context "when an authenticated user visits the root" do
    it 'should display a form they can submit' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)

      visit root_path
      fill_in "Title", with: "Test the Title"
      fill_in "URL", with: "http://www.google.com"
      click_on "Submit Link"


      expect(current_path).to eq(root_path)
      expect(page).to have_content("Test the Title")
      expect(page).to have_content("http://www.google.com")
    end

    it 'should display an error message for an invalid link' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)

      visit root_path

      fill_in "Title", with: "Test the Title"
      fill_in "URL", with: "google"
      click_on "Submit Link"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Url is not a valid URL")
    end
  end
end
