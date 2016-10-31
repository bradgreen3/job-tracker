require 'rails_helper'

describe "user sees all categories" do
  scenario "a user sees all categories" do
    cat1 = Category.create(title: "Web Development")
    cat2 = Category.create(title: "Musician")

    visit categories_path
    expect(page).to have_link("Web Development")
    expect(page).to have_link("Musician")
  end
end
