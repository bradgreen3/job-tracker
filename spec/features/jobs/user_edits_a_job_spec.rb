require 'rails_helper'

describe "User edits a job" do
  scenario "and job attributes are updated" do

    company = Company.create(name: "ESPN", city: "NYC")
    cat1 = Category.create(title: "News")
    job = company.jobs.create(title: "Mechanic", description: "Fix stuff", level_of_interest: 3, category: cat1)

    visit company_job_path(company, job)
    click_link "Edit"
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
  end
end
