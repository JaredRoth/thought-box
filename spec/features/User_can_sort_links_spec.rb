require "rails_helper"

feature "User can sort links" do
  context "when an authenticated user that has links visits the root" do
    it 'should be able to sort links', js: true do
      user = User.new password: 'password', password_confirmation: 'password', email: 'email@email.com'
      sign_up(user)
      create_links

      within(".my-links") do
        list = all(".link")
        expect(list[0]['id']).to eql("link#{Link.first.id}");
        expect(list[1]['id']).to eql("link#{Link.second.id}");
        expect(list[2]['id']).to eql("link#{Link.third.id}");
      end

      click_on "Sort by Title"
      click_on "Sort by Title"

      within(".my-links") do
        list = all(".link")
        expect(list[0]['id']).to eql("link#{Link.third.id}");
        expect(list[1]['id']).to eql("link#{Link.second.id}");
        expect(list[2]['id']).to eql("link#{Link.first.id}");
      end

      click_on "Sort by Title"

      within(".my-links") do
        list = all(".link")
        expect(list[0]['id']).to eql("link#{Link.first.id}");
        expect(list[1]['id']).to eql("link#{Link.second.id}");
        expect(list[2]['id']).to eql("link#{Link.third.id}");
      end
    end
  end
end
