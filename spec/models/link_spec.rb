require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Validations" do
    context "on a new link" do
      it 'should not be valid with an invalid url' do
        link = Link.new url: "wrongword"
        expect(link).to_not be_valid
      end
    end
  end
end
