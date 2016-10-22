require 'rails_helper'

describe "user creates a category" do
  scenario "user creates a category" do

    visit new_category_path
    fill_in "Title", with: "Web Development"
    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Web Development")
    expect(Category.count).to eq(1)
  end
end
