class Trip < ActiveRecord::Base
  belongs_to :start_station,  class_name: "Station"
  belongs_to :end_station,  class_name: "Station"

  validates :duration,          presence: true
  validates :start_date,        presence: true
  validates :start_station_name,presence: true
  validates :start_station_id,  presence: true
  validates :end_date,          presence: true
  validates :end_station_name,  presence: true
  validates :end_station_id,    presence: true
  validates :bike_id,           presence: true
  validates :subscription_type, presence: true

  def self.sort_trips_by_start_date(page)
    sort_by("start_date").take(page*30).drop((page-1)*30)
  end

  def self.average_ride
    (average("duration")/60).round(2)    
  end

  def self.longest_ride
    (maximum(:duration)/86400).round(2)
  end

  def self.shortest_ride
    (minimum(:duration)/60)
  end

  def self.highest_starting_place
    group("start_station").order("count_all DESC").count.keys.first.name
  end

  def self.highest_ending_place
    group("end_station").order("count_all DESC").count.keys.first.name    
  end

  def self.monthly_rides(month)
    where("extract(month from start_date) = ?", month).count
  end

  def self.yearly_rides(monthly, yearly)
    where("extract(month from start_date) = ? and extract(year from start_date) = ?", monthly, yearly).count
  end

end
















