require_relative 'song_list.rb'
require 'sinatra'
@@list_object = SongList.new
@@song_list = @@list_object.song_list

get '/' do 
	erb :index
end



get "/search" do
	erb :search
end

get '/enough' do
	erb :enough
end

post '/' do
	@@list_object.add_song(params[:song], params[:artist])
	if @@song_list.size >= 10
		redirect "/enough"
	else
		redirect "/"
	end
end

post '/search' do
	@results = []
	@search_term = params[:search_term]
	@@song_list.each do |song|
		if (song[0].include? @search_term) || (song[1].include? @search_term)
			@results << song
		end
	end
	erb :search_results
end





# get '/songs/:name/:artist' do
# 	if @@song_list.size >= 10
# 		redirect "/enough"
# 	else
# 		@@song_list << [params[:name], params[:artist]]
# 		redirect "/"
# 	end
# end

