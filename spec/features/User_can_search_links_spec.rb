require "rails_helper"

feature "User can search links" do
  context "when an authenticated user that has links visits the root" do
    it 'should be able to search links and have them filter', js: true do
      user = User.new password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_up(user)
      create_links

      fill_in "Search Thoughts", with: "0"

      within(".my-links") do
        expect(page).to have_content("Test the Title 0")
        expect(page).to_not have_content("Test the Title 1")
        expect(page).to_not have_content("Test the Title 2")
        expect(page).to_not have_content("Test the Title 3")
      end

      fill_in "Search Thoughts", with: "1"

      within(".my-links") do
        expect(page).to_not have_content("Test the Title 0")
        expect(page).to have_content("Test the Title 1")
        expect(page).to_not have_content("Test the Title 2")
        expect(page).to_not have_content("Test the Title 3")
      end

      fill_in "Search Thoughts", with: "2"

      within(".my-links") do
        expect(page).to_not have_content("Test the Title 0")
        expect(page).to_not have_content("Test the Title 1")
        expect(page).to have_content("Test the Title 2")
        expect(page).to_not have_content("Test the Title 3")
      end
    end
  end
end
