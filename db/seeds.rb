require 'csv'
require './app/models/station'
require './app/models/trip'

class Seed

  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    seed_stations
    seed_trips
    seed_conditions
  end

  def self.seed_stations
    CSV.foreach("./db/csv/station.csv", OPTIONS) do |row|
      row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
      Station.create!(row.to_hash)
    end
  end

  def self.seed_trips
    trips = []
    CSV.foreach("./db/csv/trip.csv", OPTIONS) do |row|
      row[:start_date] = DateTime.strptime(row[:start_date], "%m/%d/%Y %H:%M")
      row[:end_date] = DateTime.strptime(row[:end_date], "%m/%d/%Y %H:%M")
      trips << Trip.new(row.to_hash)
    end
    trips.each_slice(1000) { |slice| import(slice) }
  end

  def self.seed_conditions
    conditions = []
    CSV.foreach("./db/csv/trip.csv", OPTIONS) do |row|
      next if row[:zip_code] != "94107"
      row[:date] = Date.strptime(row[:date], "%m/%d/%Y")
      conditions << Condition.new(row.to_hash)
    end
    conditions.each_slice(1000) { |slice| import(slice) }
  end
end

Seed.start
