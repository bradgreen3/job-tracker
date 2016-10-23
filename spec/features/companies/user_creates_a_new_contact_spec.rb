require 'rails_helper'

describe 'user creates a contact' do
  scenario 'user creates a contact and sees it on company page' do
    company = Company.create(name: "ESPN", city: "LA")
    cat1 = Category.create(title: "News")
    job = company.jobs.create(title: "Journalist", level_of_interest: 70, category: cat1, description: "Write about sports events")
    company.contacts.create(full_name: "Kirk Herbstreit", email: "kirk@espn.com", position: "Announcer")

    visit company_jobs_path(company, job)
    click_link "New Contact"

    expect(current_path).to eq(new_company_contact_path(company))

    fill_in "contact_full_name", with: "Lee Corso"
    fill_in "contact_position", with: "Announcer"
    fill_in "contact_email", with: "corso@espn.com"
    click_button "Create Contact"

    save_and_open_page
    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Lee Corso")
    expect(page).to have_content("Announcer")
    expect(page).to have_content("corso@espn.com")

  end
end
