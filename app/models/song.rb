class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_id, presence: true
  
  belongs_to :artist
end
