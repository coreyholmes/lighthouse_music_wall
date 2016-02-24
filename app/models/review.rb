class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  
  validates :title, presence: true
  validates :content, presence: true
end