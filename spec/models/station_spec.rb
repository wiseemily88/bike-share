
require "spec_helper"

describe Station do

  describe "Validation" do
    it "is invalid without a name" do
      station = Station.new(lat: 37.329732, long: -121.901782, dock_count: 1,
                            city: "Denver",
                            installation_date: Date.new(2015, 12, 8))

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Luis and 3/4", lat: 37.329732,
                            long: -121.901782, city: "Denver",
                            installation_date: Date.new(2015, 12, 8))

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Luis and 3/4", lat: 37.329732,
                            long: -121.901782, dock_count: 1,
                            installation_date: Date.new(2015, 12, 8))

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "Luis and 3/4", lat: 37.329732,
                            long: -121.901782, dock_count: 1, city: "Denver")

      expect(station).to_not be_valid
    end

    it "is invalid if name is not unique" do
      Station.create(name: "Luis and 3/4", lat: 37.329732, long: -121.901782,
                     dock_count: 1, city: "Denver",
                     installation_date: Date.new(2015, 12, 8))
      station = Station.create(name: "Luis and 3/4",
                               lat: 37.329732,
                               long: -121.901782,
                               dock_count: 2, city: "Kansas",
                               installation_date: Date.new(2015, 12, 9))

      expect(station).to_not be_valid
    end
  end

  describe ".count" do
    it "returns total number of stations" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 11, lat: 22 )
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8), long: 11, lat: 22 )

      expect(Station.count).to eq(2)
    end
  end

  describe ".average_bikes_per_stations" do
    it "returns average bikes per station" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 11, lat: 22 )
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8), long: 11, lat: 22 )

      expect(Station.average_bikes_per_stations).to eq(14)
    end
  end

  describe ".highest_bike_count" do
    it "returns bike count value" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 11, lat: 22 )
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8), long: 11, lat: 22 )

      expect(Station.highest_bike_count).to eq(15)
    end
  end

  describe ".lowest_bike_count" do
    it "returns bike count value" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 11, lat: 22 )
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8), long: 11, lat: 22 )

      expect(Station.lowest_bike_count).to eq(13)
    end
  end

  describe ".newest_station" do
    it "returns the date of the newest station" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 11, lat: 22 )
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8), long: 11, lat: 22 )

      expect(Station.newest_station).to eq(Date.new(2015, 15, 8))
    end
  end

  describe ".oldest_station" do
    it "returns the date of the oldest station" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 11, lat: 22 )
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8), long: 11, lat: 22 )

      expect(Station.oldest_station).to eq(Date.new(2015, 12, 8))
    end
  end

  describe "Feature" do
    describe "when a user visits '/stations'" do
      it "they see available stations" do
        visit "/stations"

        within("#body-content") do
          expect(page).to have_content("Currently Available Stations!")
        end
      end
    end

    describe "when a user clicks on edit" do
      it "they will see the edit page" do
        Station.create(name: "Luis and 3/4", lat: 37.329732, long: -121.901782,
                       dock_count: 1, city: "Denver",
                       installation_date: Date.new(2015, 12, 8))
        visit "/stations"
        click_on "Edit"

        expect(page).to have_content("Edit Station")
      end
    end

    describe "when a user clicks on create a new station" do
      it "they will see the new station page" do
        Station.create(name: "Luis and 3/4", lat: 37.329732, long: -121.901782,
                       dock_count: 1, city: "Denver",
                       installation_date: Date.new(2015, 12, 8))
        visit "/stations"
        click_on "Create a new station"

        expect(page).to have_content("New Station")
      end
    end

    describe "when a user clicks on create a show" do
      it "they will see the show page" do
        Station.create(name: "Luis and 3/4", lat: 37.329732, long: -121.901782,
                       dock_count: 1, city: "Denver",
                       installation_date: Date.new(2015, 12, 8))
        visit "/stations"
        click_on "Show"

        expect(page).to have_content("Here is yo Station!")
      end
    end    
  end
end
