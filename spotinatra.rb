require 'sinatra'
@@song_list = [["stairway to heaven", "led zeppelin"], ["waka waka", "shakira"], ["yellow submarine", "beatles"], ["happy", "pharell"], ["loca", "shakira"], ["smells like teen spirit", "nirvana"]]

get '/' do 
	erb :index
end



get "/search" do
	erb :search
end

get '/enough' do
	"YOUR MUSIC IS WORTH F**ING NOTHING"
end

post '/' do
	@@song_list << [params[:song], params[:artist]]
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

