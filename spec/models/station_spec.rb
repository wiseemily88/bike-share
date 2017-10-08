require_relative '../spec_helper'
RSpec.describe Station do

  describe "Validation" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 1, city: "Denver", installation_date: Date.new(2015, 12, 8), long: 2.2, lat: 3.3)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Luis and 3/4", city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Luis and 3/4", dock_count: 1, installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "Luis and 3/4", dock_count: 1, city: "Denver",long: 2.2, lat: 3.3)

      expect(station).to_not be_valid
    end

    it "is invalid if name is not unique" do
      Station.create(name: "Luis and 3/4", dock_count: 1, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      station = Station.create(name: "Luis and 3/4", dock_count: 2, city: "Kansas", installation_date: Date.new(2015, 12, 9),long: 2.2, lat: 3.3)

      expect(station).to_not be_valid
    end
  end

  describe ".count" do
    it "returns total number of stations" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8),long: 2.2, lat: 3.3)

      expect(Station.count).to eq(2)
    end
  end

  describe ".average_bikes_per_stations" do
    it "returns average bikes per station" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8),long: 2.2, lat: 3.3)

      expect(Station.average_bikes_per_stations).to eq(14)
    end
  end

  describe ".highest_bike_count" do
    it "returns bike count value" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8),long: 2.2, lat: 3.3)

      expect(Station.highest_bike_count).to eq(15)
    end
  end

  describe ".lowest_bike_count" do
    it "returns bike count value" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8),long: 2.2, lat: 3.3)

      expect(Station.lowest_bike_count).to eq(13)
    end
  end

  describe ".newest_station" do
    it "returns the date of the newest station" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8),long: 2.2, lat: 3.3)

      expect(Station.newest_station).to eq(Date.new(2015, 15, 8))
    end
  end

  describe ".oldest_station" do
    it "returns the date of the oldest station" do
      Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
      Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 15, 8),long: 2.2, lat: 3.3)

      expect(Station.oldest_station).to eq(Date.new(2015, 12, 8))
    end
  end

end
