require 'rails_helper'

RSpec.describe "edit shelter", type: :feature do
  it "there is a button to edit shelter" do
    shelter_1 = Shelter.create(name: "Blue Blue Barky",
                               address: "123 This Way",
                               city: "Denver",
                               state: "CO",
                               zip: "90204")

    shelter_2 = Shelter.create(name: "Puppy Pound",
                               address: "5608 N Eaton St.",
                               city: "Chicago",
                               state: "IL",
                               zip: "80234")

    visit "/shelters/#{shelter_1.id}"

    click_link("edit shelter")

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/edit")
  end
end
