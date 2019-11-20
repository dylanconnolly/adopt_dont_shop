require 'rails_helper'

RSpec.describe "delete shelter", type: :feature do
  it "user can delete a shelter" do
    shelter_1 = Shelter.create(name: "Blue Blue Barky",
                               address: "123 This Way",
                               city: "Denver",
                               state: "CO",
                               zip: "90204")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("delete shelter")
  end
end
