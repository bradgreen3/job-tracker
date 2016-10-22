require 'rails_helper'

describe "user sees one category" do
  scenario "user sees one category" do

  cat1 = Category.create(title: "Web Development")
  cat2 = Category.create(title: "Musician")

  visit categories_path
  click_on "Web Development"

  expect(current_path).to eq("/categories/#{cat1.id}")
  expect(page).to have_content("Web Development")

  end

  scenario "user sees jobs related to category" do
    cat1 = Category.create(title: "Web Development")
    cat2 = Category.create(title: "Musician")
    company = Company.create(name: "ESPN", city: "Atlanta")
    job1 = cat1.jobs.create(title: "Rails Developer", description: "Write Ruby", level_of_interest: 70, company_id: company.id)
    job2 = cat1.jobs.create(title: "Javascript Developer", description: "Write Javascript", level_of_interest: 50, company_id: company.id)
    job3 = cat2.jobs.create(title: "Saxophonist", description: "Play saxophone", level_of_interest: 30, company_id: company.id)

    visit categories_path
    click_on "Web Development"

    expect(page).to have_content("Rails Developer")
    expect(page).to have_content("Javascript Developer")
    expect(page).to_not have_content("Saxophonist")

  end
end
