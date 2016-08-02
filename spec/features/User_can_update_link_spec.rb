require "rails_helper"

feature "User can update a link's contents" do
  context "when an authenticated user that has links clicks edit" do
    it 'should be taken to an edit page' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)
      create_link
      link = user.links.first

      within("#link#{link.id}") do
        click_on "mode_edit"
      end

      expect(current_path).to eq(edit_link_path(link))
    end

    it 'should be able to edit the title and/or the link`' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)
      create_link

      within("#link#{user.links.first.id}") do
        click_on "mode_edit"
      end

      fill_in user.links.first.title, with: "Updated Title"
      fill_in user.links.first.url, with: "http://www.Updated.com"
      click_on "Update Link"

      expect(current_path).to eq(root_path)
      expect(user.links.first.title).to eq("Updated Title")
      expect(user.links.first.url).to eq("http://www.Updated.com")

      within("#link#{user.links.first.id}") do
        expect(page).to have_content("Updated Title")
        expect(page).to have_content("http://www.Updated.com")
      end
    end

    it 'should validate the new url' do
      user = User.create password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_in(user)
      create_link

      within("#link#{user.links.first.id}") do
        click_on "mode_edit"
      end

      fill_in user.links.first.title, with: "Updated Title"
      fill_in user.links.first.url, with: "www.Updated.com"
      click_on "Update Link"

      expect(current_path).to eq(link_path(user.links.first.id))
      expect(page).to have_content("Url is not a valid URL")
    end
  end
end
