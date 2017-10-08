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

end
