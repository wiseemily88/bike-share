require "spec_helper"

RSpec.describe "When a user creates a condition '/conditions/new" do
  it "they can add a condition" do
    visit "/conditions/new"
    fill_in 'condition[date]',                    with: Date.today
    fill_in 'condition[max_temperature_f]',       with: 65
    fill_in 'condition[min_temperature_f]',       with: 35
    fill_in 'conditions[mean_temperature_f]',     with: 50
    fill_in 'conditions[mean_humidity]',          with: 3
    fill_in 'conditions[mean_visibility_miles]',  with: 2
    fill_in 'conditions[mean_wind_speed_mph]',    with: 10
    fill_in 'conditions[precipitation_inches]',   with: 3
    fill_in 'conditions[zip_code]',               with: 80214
    click_on "Add New Trip"

    expect(page).to have_content("65")
    expect(page).to have_content("35")
    expect(page).to have_content("50")
    expect(page).to have_content("3")
    expect(page).to have_content("2")
    expect(page).to have_content("10")
    expect(page).to have_content("3")
    expect(page).to have_content("80214")
  end
end
