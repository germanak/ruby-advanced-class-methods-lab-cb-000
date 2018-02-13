require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song
  end

  def self.find_by_name(title)
    self.all.detect{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_data = file_name.split(" - ")
    song = self.new
    binding.pry
  end
end
