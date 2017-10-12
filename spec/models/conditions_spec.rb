require "spec_helper"

describe Condition do
  describe "Validation" do
    it "is invalid without a date" do
      condtion = Condition.new(
      max_temperature_f: 70,
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a unique date" do
      Condition.create(
      date: Date.new(2013,8,28),
      max_temperature_f: 70,
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      condtion = Condition.create(
      date: Date.new(2013,8,28),
      max_temperature_f: 72,
      min_temperature_f: 42,
      mean_temperature_f: 64,
      mean_humidity: 38,
      mean_visibility_miles: 1,
      mean_wind_speed_mph: 3,
      precipitation_inches: 2,
      zip_code: 95233)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a max temperature" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a min temperature" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean temperature" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean humidity" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean visibility" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean wind speed" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_visibility_miles: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a precipitation" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_visibility_miles: 4 ,
      mean_wind_speed_mph: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a zip code" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_visibility_miles: 4 ,
      mean_wind_speed_mph: 1,
      precipitation_inches: 4)

      expect(condtion).to_not be_valid
    end
  end
end