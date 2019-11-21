require 'rails_helper'

RSpec.describe "pets index", type: :feature do
  it "lists all pets with their details" do
      pet_1 = Pet.create(name: "Rufus")
      pet_2 = Pet.create(name: "Peter")

    visit '/pets'

    expect(page).to have_content(pet_1)
    expect(page).to have_content(pet_2)
  end
end
