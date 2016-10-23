require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create(name: "ESPN", city: "LA")
    cat1 = Category.create(title: "News")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, category: cat1, description: "yay")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user can leave a comment on a job" do
   company = Company.create(name: "ESPN", city: "LA")
   cat1 = Category.create(title: "Education")
   job = company.jobs.create(title: "Developer", description: "Something", level_of_interest: 70, category: cat1 )

   visit company_job_path(company, job)

   fill_in "comment_body", with: "Spoke to hiring manager"
   click_button "Submit"

   expect(current_path).to eq(company_job_path(company, job))
   expect(page).to have_content("Spoke to hiring manager")

 end
end
