class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_id, presence: true

  belongs_to :artist
  
  default_scope { order(:title) }

  def self.filter_by(artist_id)
    if artist_id
      Song.where(artist_id: artist_id)
    else
      Song.all
    end
  end
end
