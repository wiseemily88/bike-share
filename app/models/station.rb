class Station < ActiveRecord::Base

  validates :name,              presence: true, uniqueness: true
  validates :dock_count,        presence: true
  validates :city,              presence: true
  validates :installation_date, presence: true
  validates :lat,               presence: true
  validates :long,              presence: true

  scope :newest, -> { where(installation_date: maximum('installation_date')).first }
end
