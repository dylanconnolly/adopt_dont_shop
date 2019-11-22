require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Blue Blue Barky",
      address: "123 This Way",
      city: "Denver",
      state: "CO",
      zip: "90204")

    @shelter_2 = Shelter.create(name: "Puppy Pound",
      address: "5608 N Eaton St.",
      city: "Chicago",
      state: "IL",
      zip: "80234")
  end

  it "can see all shelter names" do

    visit "/shelters"

    expect(page).to have_content(@shelter_1.name)

    expect(page).to have_content(@shelter_2.name)
  end

  it "has an edit link for each shelter and link takes user to that shelter's edit form" do

    visit "/shelters"

    expect(page).to have_link("/shelters/#{@shelter_1.id}/edit")
    expect(page).to have_link("/shelters/#{@shelter_2.id}/edit")

  end
end
