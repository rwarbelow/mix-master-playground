require 'rails_helper'

RSpec.feature "User views songs for specific artist" do
  scenario "they see all associated songs" do
    artist = create(:artist_with_songs, songs_count: 3)

    visit artist_path(artist)
    click_on "View songs"

    artist.songs.each do |song|
      expect(page).to have_content song.title
      expect(page).to have_link song.title, href: song_path(song)
    end
  end
end