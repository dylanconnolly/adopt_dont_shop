require 'rails_helper'

RSpec.describe "new shelter link", type: :feature do
  it "can redirect to new shelter form" do

    visit '/shelters'
    click_link("new shelter")

    expect(page).to have_current_path("/shelters/new")
  end
end
