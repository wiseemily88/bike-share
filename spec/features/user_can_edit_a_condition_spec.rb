require "spec_helper"

RSpec.describe "When a user edits a condition '/conditions/:id/edit" do
  it "they can edit a condition" do
    condition = Condition.create!(
                                  date: Date.today,
                                  max_temperature_f: 60,
                                  min_temperature_f: 30,
                                  mean_temperature_f: 45,
                                  mean_humidity: 2,
                                  mean_visibility_miles: 1,
                                  mean_wind_speed_mph: 5,
                                  precipitation_inches: 2,
                                  zip_code: 80202
                                 )
    visit "/conditions/#{condition.id}/edit"
    fill_in 'station[name]', with: "Denver Bike"

    click_on "Save Changes"

    expect(page).to have_content("Denver Bike")
  end
end
