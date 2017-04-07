class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name = "Michael Jackson") @name, @songs = name, [] end

  def add_song(song) @songs << song end

  def save() @@all << self end

  def self.all() @@all end

  def self.find_or_create_by_name(name)
    if @@all.any? { |x| x.name.include?(name) }
      @@all.find { |x| x.name }
    else
      n = Artist.new(name)
      n.save
      n
    end
  end

  def print_songs() @songs.each { |x| puts x.name } end

end
