require 'rails_helper'

RSpec.describe "shelter pet index", type: :feature do
  it "lists all the shelter's pets and their details" do

    shelter_1 = Shelter.create(name: "Blue Blue Barky",
                               address: "123 This Way",
                               city: "Denver",
                               state: "CO",
                               zip: "90204")

    shelter_2 = Shelter.create(name: "Rodeo Roundup Soundup Pupps",
                              address: "5608 N Eaton St.",
                              city: "Chicago",
                              state: "IL",
                              zip: "80234")

    pet_1 = Pet.create(name: "Rufus", image: "some_path", approximate_age: "4", sex: "male", shelter: shelter_1)
    pet_2 = Pet.create(name: "Peter", image: "some_url", approximate_age: "1", sex: "male", shelter: shelter_2)

    visit "/shelters/#{shelter_1.id}/pets"

    find("img[src='some_path']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to_not have_content(pet_2.name)
  end
end
