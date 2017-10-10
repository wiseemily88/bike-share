require "spec_helper"

RSpec.describe "When a user edits a station '/stations/:id/edit" do

  let(:station) do
    Station.create(
      name: "Miami Bike",
      dock_count: 23,
      city: "Miami",
      installation_date: Date.today,
      lat: 23.23,
      long: 34.32
    )
  end

  before do
    visit "/stations/:id/edit"
  end

  it "they can edit a station" do
    fill_in 'Station Name', with: "Miami Bike"
    fill_in 'Number of Docks', with: 26
    fill_in 'City', with: "Miami"
    fill_in 'Date Installed', with: Date.today

    click_button 'Save Changes'
    expect(page).to have_content("Miami Bike")
  end
end
