class Curator
  attr_accessor :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_photograph_by_id(id)
    @photographs.find { |photo| photo.id == id }
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all { |photo| photo.artist_id == artist.id }
  end

  def photographs_taken_by_artist_from(country)
    artists_from_country = @artists.find_all { |artist| artist.country == country}
    artist_ids = artists_from_country.map { |artist| artist.id}
    photos = @photographs.map do |photo|
      if artist_ids.include?(photo.artist_id)
        photo
      end
    end
    photos.delete(nil)
    photos
  end

  def artists_with_multiple_photographs
    artist_hash = @artists.reduce({}) do |acc, artist|
      acc[artist.id] = 0
      acc
    end

    artist_lookup = @artists.reduce({}) do |acc, artist|
      acc[artist.id] = artist
      acc
    end

    @photographs.map do |photo|
        artist_hash[photo.artist_id] += 1
    end

    artist_ids = artist_hash.select { |k, v| v > 1 }.keys

    artist_ids.map { |id| artist_lookup[id] }
  end

end
