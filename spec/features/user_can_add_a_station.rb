require "spec_helper"

RSpec.describe "When a user adds a new station '/stations/new" do

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
    visit "/stations/new"
  end

  it "they can add a station" do
    fill_in 'Station Name', with: "Miami Bike"
    fill_in 'Number of Docks', with: 23
    fill_in 'City', with: "Miami"
    fill_in 'Date Installed', with: Date.today

    click_button 'Sign in'
    expect(page).to have_content "Welcome back, #{user.first_name}!"
    expect(page).to have_content("Miami Bike")
  end
