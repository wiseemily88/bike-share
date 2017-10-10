require_relative '../spec_helper'

RSpec.describe Trip do

  describe "Validation" do
    it "is invalid without a duration" do
      trip = Trip.new(
        start_date: DateTime.new(2013,8,29,14,13),
         start_station_name: "South Van Ness at Market",
         start_station_id: 66,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "South Van Ness at Market",
         end_station_id: 66,
         bike_id: 520,
         subscription_type: "Subscriber",
         zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      trip = Trip.new(
        duration: 63,
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_name" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_name" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end
  end

  describe "trip stats" do 
    before do 
      2.times do
          Trip.create(
            duration: 63,
            start_date: DateTime.new(2013,8,29,14,13),
            start_station_name: "South Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2013,8,29,14,14),
            end_station_name: "South Van Ness at Market",
            end_station_id: 66,
            bike_id: 520,
            zip_code: 94127,
            subscription_type: "Customer" 
          )
      end
    end

    let!(:trip) do 
      Trip.create(
        duration: 63,
        start_date: DateTime.new(2014,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2014,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 400,
        zip_code: 94127,
        subscription_type: "Subscriber" 
      )
    end

    describe ".least_ridden_bike" do
      it "returns least ridden bike ID and trips" do
        expect(Trip.least_ridden_bike).to eq [trip.bike_id, 1]
      end
    end

    describe ".user_subcription" do
      it "returns count for each subsrciption type" do
        expect(Trip.user_subscription).to eq ({"Subscriber" => 1, "Customer" => 2})
      end
    end

    describe ".percentage" do
      it "returns percentage for each subsrciption type" do
        expect(Trip.percentage("Subscriber")).to eq (33.33)
      end
    end

    describe ".percentage" do
      it "returns percentage for each subsrciption type" do
        expect(Trip.percentage("Customer")).to eq (66.67)
      end
    end

    describe ".highest_trip_count" do 
      it "returns highest trip count" do
        expect(Trip.highest_trip_count[1]).to eq (2)
      end
    end

    describe ".lowest_trip_count" do 
      it "returns lowest trip count" do
        expect(Trip.lowest_trip_count[1]).to eq (1)
      end
    end

  end
end











