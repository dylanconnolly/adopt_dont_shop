require 'rails_helper'

RSpec.describe "new shelter link", type: :feature do
  it "can redirect to new shelter form" do

    visit '/shelters'
    click_link("new shelter")

    expect(page).to have_current_path("/shelters/new")
  end
end

RSpec.describe "new shelter form", type: :feature do
  it "will ask for all shelter attributes" do

    visit '/shelters/new'

    expect(page).to have_field("shelter[name]")
    expect(page).to have_field("shelter[address]")
    expect(page).to have_field("shelter[city]")
    expect(page).to have_field("shelter[state]")
    expect(page).to have_field("shelter[zip]")
  end
end
