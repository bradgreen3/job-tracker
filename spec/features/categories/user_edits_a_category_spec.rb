require 'rails_helper'

describe "user edits a category" do
  scenario "user edits a category" do

    category = Category.create(title: "Web Development")

    visit categories_path
    within(".category_#{category.id}") do
      click_link "Edit"

    end

    fill_in "category_title", with: "Astronaut"
    click_button "Update"
    expect(current_path).to eq categories_path
    expect(page).to have_content("Astronaut")
  end
end
