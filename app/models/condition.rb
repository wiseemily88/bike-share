require 'pry'
class Condition < ActiveRecord::Base

  self.primary_key = "date"

  has_many :trips , class_name: "Trip", primary_key: "date", foreign_key: "start_date"

  validates :date,                presence: true, uniqueness: true
  validates :max_temperature_f,    presence: true
  validates :min_temperature_f,   presence: true
  validates :mean_temperature_f,  presence: true
  validates :mean_humidity,       presence: true
  validates :mean_visibility_miles,presence: true
  validates :mean_wind_speed_mph,  presence: true
  validates :precipitation_inches,presence: true
  validates :zip_code,            presence: true

  def self.trip_array(range)
    all.group_by do |condition|
      condition.max_temperature_f
    end.select do |k, v|
      range.include?(k)
    end.values.flatten.map do |condition|
      condition.trips.count
    end.flatten
  end

  # def self.average_number_of_rides(trip_array)
  #   (trip_array.sum) / (trip_array.count)
  # end

  def self.highest_number_of_rides

  end

  def self.lowest_number_of_rides

  end


end
