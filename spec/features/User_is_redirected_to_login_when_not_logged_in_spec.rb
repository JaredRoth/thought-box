require "rails_helper"

feature "User is redirected to login" do
  context "when not logged in" do
    it 'should be redirected to login page with error message' do
      visit root_path

      expect(current_path).to eq(signin_path)

      expect(page).to have_content("You must be logged in to use this app")
    end
  end
end
