class SongList
	attr_accessor :song_list

	def initialize
		@song_list = [["stairway to heaven", "led zeppelin"], ["waka waka", "shakira"], ["yellow submarine", "beatles"], ["happy", "pharell"], ["loca", "shakira"], ["smells like teen spirit", "nirvana"]]
	end

	def add_song(song, artist)
		@song_list << [song, artist]
	end
end