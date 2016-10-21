require 'rails_helper'

describe "user deletes a job" do
  scenario "the job no longer appears in company job index" do

  company = Company.create(name: "ESPN", city: "NYC")
  job = company.jobs.create(title: "Mechanic", description: "Fix stuff", level_of_interest: 3)
  job2 = company.jobs.create(title: "Developer", description: "Make stuff", level_of_interest: 100)

  visit company_job_path(company, job)
  click_on "Delete"

  expect(page).to have_content("Mechanic was successfully deleted!")
  expect(page).to_not have_link("Mechanic")

  end
end
