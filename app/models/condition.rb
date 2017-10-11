class Condition < ActiveRecord::Base
  self.primary_key = "date"

  has_many :trips , class_name: "Trip", primary_key: "date", foreign_key: "start_date"

  validates :date,                  presence: true, uniqueness: true
  validates :max_temperature_f,     presence: true
  validates :min_temperature_f,     presence: true
  validates :mean_temperature_f,    presence: true
  validates :mean_humidity,         presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph,   presence: true
  validates :precipitation_inches,  presence: true
  validates :zip_code,              presence: true


  def self.trips_with_max_temperature(min, max)
    joins(:trips)
    .where("max_temperature_f >= ? AND max_temperature_f <= ?", min, max)
  end

  def self.average_trips_with_max_temperature(min, max)
    trips = trips_with_max_temperature(min, max).count
    total_days = where("max_temperature_f >= ? AND max_temperature_f <= ?", min, max).count
    (trips/total_days).round(2)
  end

  def self.highest_trips_with_max_temperature(min, max)
    trips_with_max_temperature(min, max)
    .group(:start_date)
    .order("count_all DESC")
    .count
    .values
    .first
  end 

  def self.lowest_trips_with_max_temperature(min, max)
    trips_with_max_temperature(min, max)
    .group(:start_date)
    .order("count_all ASC")
    .count
    .values
    .first
  end 

  def self.trips_with_wind_speed(min, max)
    joins(:trips)
    .where("mean_wind_speed_mph >= ? AND mean_wind_speed_mph <= ?", min, max)
    .count
  end

  def self.average_trips_with_wind_speed(min, max)
    trips = trips_with_wind_speed(min, max)
    total_days = where("mean_wind_speed_mph >= ? AND mean_wind_speed_mph <= ?", min, max).count
    (trips/total_days).round(2)
  end



end
