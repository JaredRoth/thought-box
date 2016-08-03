require "rails_helper"

feature "User can update a link status" do
  context "when an authenticated user that has links visits the root" do
    it 'should be able to mark links as read and stay on the page', js: true do
      user = User.new password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_up(user)
      create_link

      expect(user.links.first.read).to eq(false)

      within("#link#{user.links.first.id}") do
        find(".read-status").click
      end

      expect(user.links.first.read).to eq(true)
    end

    xit 'should be able to mark links as unread and stay on the page' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)
      create_link

      within("#link#{user.links.first.id}") do
        find(".read-status").click
      end

      within("#link#{user.links.first.id}") do
        find(".read-status").click
      end

      expect(user.links.first.read).to eq(false)
    end
  end
end
