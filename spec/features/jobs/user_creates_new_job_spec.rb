require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    cat1 = Category.create(title: "News")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
  end

  scenario "a user is redirected from new job to new category" do
    company = Company.create(name: "ESPN", city: "NYC")

    visit new_company_job_path(company)
    click_link "New Category"

    expect(current_path).to eq(new_category_path)
  end

  scenario "a user selects a category for job" do
    company = Company.create(name: "ESPN", city: "NYC")
    cat1 = Category.create(title: "News")
    cat2 = Category.create(title: "Computers")
    cat3 = Category.create(title: "Service")

    visit new_company_job_path(company)
    select "News", :from => "job_category_id"
    fill_in "job[title]", with: "Announcer"
    fill_in "job[description]", with: "Announce football games on TV"
    fill_in "job[level_of_interest]", with: 80

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("News")

  end


end
