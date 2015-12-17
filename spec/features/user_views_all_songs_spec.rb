require 'rails_helper'

RSpec.feature "User views songs" do
  scenario "they see all songs sorted alphabetically by title" do
    artist               = create(:artist_with_songs, songs_count: 3)
    first, second, third = artist.songs.sort_by{ |song| song.title }

    visit artist_path(artist)
    click_on "View songs"

    within "li:first" do
      expect(page).to have_content first.title
      expect(page).to have_link first.title, href: song_path(first)
    end

    within "li:last" do
      expect(page).to have_content third.title
      expect(page).to have_link third.title, href: song_path(third)
    end
  end
end
