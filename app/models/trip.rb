class Trips < ActiveRecord::Migration[5.1]
  belongs_to :start_station, foreign_key: :station_id
  belongs_to :end_station, foreign_key: :station_id

  validates :duration,          presence: true
  validates :start_date,        presence: true
  validates :start_station_name,presence: true
  validates :start_station_id,  presence: true
  validates :end_date,          presence: true
  validates :end_station_name,  presence: true
  validates :bike_id,           presence: true
  validates :subscription_type, presence: true
  validates :zip_code,          allow_blank: true



end
