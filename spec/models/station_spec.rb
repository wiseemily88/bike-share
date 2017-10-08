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
