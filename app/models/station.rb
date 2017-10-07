class Station < ActiveRecord::Base

  validates :name,              presence: true, uniqueness: true
  validates :dock_count,        presence: true
  validates :city,              presence: true
  validates :installation_date, presence: true
  validates :lat,               presence: true
  validates :long,              presence: true

  def self.average_bikes_per_stations
    average("dock_count").floor
  end

  def self.highest_bike_count
    maximum("dock_count")
  end

  def self.lowest_bike_count
    minimum("dock_count")
  end

  def self.newest_station
    maximum("installation_date")
  end

  def self.oldest_station
    minimum("installation_date")
  end

end
