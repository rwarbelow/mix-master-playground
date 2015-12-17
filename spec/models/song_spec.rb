require 'rails_helper'

RSpec.describe Song, "validations", type: :model do
  it { is_expected.to validate_presence_of(:title) } 
  it { is_expected.to validate_presence_of(:artist_id) } 
end


RSpec.describe Song, ".filter_by", type: :model do
  scenario "with artist id" do
    artist_one = create(:artist_with_songs, songs_count: 1)
    artist_two = create(:artist_with_songs, songs_count: 3)
    first, second, third = artist_two.songs.sort_by { |song| song.title }

    results = Song.filter_by(artist_two.id)

    expect(results).to eq([first, second, third])
  end

  scenario "without artist id" do
    songs = create_list(:song, 3)
    first, second, third = songs.sort_by { |song| song.title }

    results = Song.filter_by(nil)

    expect(results).to eq([first, second, third])
  end
end