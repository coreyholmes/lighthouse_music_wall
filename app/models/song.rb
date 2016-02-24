class Song < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  
  validates :name, presence: true
  validates :artist, presence: true
  validates :url, presence: true
end
