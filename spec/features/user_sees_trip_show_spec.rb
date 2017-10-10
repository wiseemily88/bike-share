require "spec_helper"

RSpec.describe "When a user visits '/stations/:id'" do

  let(:station) do
    Trip.create!(
      duration: 63,
      start_date: DateTime.new(2013,8,28,14,14),
      start_station_name: "Station 1",
      start_station_id: 1,
      end_date: DateTime.new(2013,8,29,14,14),
      end_station_name: "Station 2",
      end_station_id: 2,
      bike_id: 520,
      subscription_type: "Subscriber",
      zip_code: 94127
    )
  end

  before do
    visit "/stations/#{station.id}"
  end

  it "they see a station name" do
    expect(page).to have_content("Miami Bike")
  end

  it "they see dock count" do
    expect(page).to have_content("Dock Count: #{station.dock_count}")
  end

  it "they see city" do
    expect(page).to have_content("City: #{station.city}")
  end
end
