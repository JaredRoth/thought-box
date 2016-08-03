require "rails_helper"

feature "User can update a link status" do
  context "when an authenticated user that has links visits the root" do
    it 'should be able to mark links as read and stay on the page', js: true do
      user = User.new password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_up(user)
      create_link

      expect(User.first.links.first.read).to eq(false)

      within("#link#{User.first.links.first.id}") do
        find(".read-status").click
      end
      sleep(1)

      expect(User.first.links.first.read).to eq(true)

      within("#link#{User.first.links.first.id}") do
        find(".read-status").click
      end
      sleep(1)

      expect(User.first.links.first.read).to eq(false)
    end
  end
end
