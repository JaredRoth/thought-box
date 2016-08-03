require "rails_helper"

feature "User can filter links by status" do
  context "when an authenticated user that has links visits the root" do
    it 'should be able to filter links by read status', js: true do
      user = User.new password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_up(user)
      create_links

      within(".my-links") do
        expect(page).to have_content("Test the Title 0")
        expect(page).to have_content("Test the Title 1")
        expect(page).to have_content("Test the Title 2")
      end

      within("#link#{Link.second.id}") do
        find(".read-status").click
      end

      click_on "Filter by Read"

      within(".my-links") do
        expect(page).to_not have_content("Test the Title 0")
        expect(page).to have_content("Test the Title 1")
        expect(page).to_not have_content("Test the Title 2")
      end

      click_on "Filter by Unread"

      within(".my-links") do
        expect(page).to have_content("Test the Title 0")
        expect(page).to_not have_content("Test the Title 1")
        expect(page).to have_content("Test the Title 2")
      end

      click_on "View all read statuses"

      within(".my-links") do
        expect(page).to have_content("Test the Title 0")
        expect(page).to have_content("Test the Title 1")
        expect(page).to have_content("Test the Title 2")
      end
    end
  end
end
