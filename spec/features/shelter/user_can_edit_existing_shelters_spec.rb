require 'rails_helper'

RSpec.describe "specific shelter", type: :feature do
  it "there is a button to edit shelter" do
    shelter_1 = Shelter.create(name: "Blue Blue Barky",
                               address: "123 This Way",
                               city: "Denver",
                               state: "CO",
                               zip: "90204")

    visit "/shelters/#{shelter_1.id}"

    click_link("edit shelter")

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/edit")
  end

  it "user can update fields and click submit" do
    shelter_1 = Shelter.create(name: "Blue Blue Barky",
                               address: "123 This Way",
                               city: "Denver",
                               state: "CO",
                               zip: "90204")

    visit "/shelters/#{shelter_1.id}/edit"

    fill_in "name", with: "I changed this name"
    fill_in "address", with: "1820 Fake Blvd"

    expect(page).to have_field ("shelter[city]")
    expect(page).to have_field ("shelter[state]")
    expect(page).to have_field ("shelter[zip]")

    click_button("shelter submit")

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("I changed this name")
  end
end
