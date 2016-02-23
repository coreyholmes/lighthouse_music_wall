class Songs < ActiveRecord::Base
  validates :name, presence: true
  validates :artist, presence: true
  validates :url, presence: true
end
