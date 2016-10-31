require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Web Development")

    visit categories_path
    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Web Development was successfully deleted!")

  end
end
