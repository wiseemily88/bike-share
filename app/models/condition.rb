class Condition < ActiveRecord::Base
  validates :date,                presence: true, uniqueness: true
  validates :max_temperature_f,    presence: true
  validates :min_temperature_f,   presence: true
  validates :mean_temperature_f,  presence: true
  validates :mean_humidity,       presence: true
  validates :mean_visibility_miles,presence: true
  validates :mean_wind_Speed_mph,  presence: true
  validates :precipitation_inches,presence: true
  validates :zip_code,            presence: true
end
