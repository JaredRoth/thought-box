require "rails_helper"

feature "User can update a link status" do
  context "when an authenticated user that has links visits the root" do
    it 'should be able to mark links as read and stay on the page' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)

      visit root_path
      fill_in "Title", with: "Test the Title"
      fill_in "URL", with: "http://www.google.com"
      click_on "Submit Link"

      expect(user.links.first.read).to eq(false)

      within(".my-links") do
        click_on "Mark as Read"
      end

      expect(user.links.first.read).to eq(true)
    end

    it 'should be able to mark links as unread and stay on the page' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)

      visit root_path
      fill_in "Title", with: "Test the Title"
      fill_in "URL", with: "http://www.google.com"
      click_on "Submit Link"

      within(".my-links") do
        click_on "Mark as Read"
      end

      within(".my-links") do
        click_on "Mark as Unread"
      end

      expect(user.links.first.read).to eq(false)
    end
  end
end


# Read links should be stylistically differentiated from unread links. You could gray them out or use a strike through.
