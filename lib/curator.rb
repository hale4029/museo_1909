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
  end

  def photographs_taken_by_artist_from(country)
  end

  def artists_with_multiple_photographs
  end

end
