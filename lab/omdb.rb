require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'

get '/' do
  html = %q(
  <html><head><title>Movie Search</title></head><body>
  <h1>Find a Movie!</h1>
  <form accept-charset="UTF-8" action="/result" method="post">
    <label for="movie">Search for:</label>
    <input id="movie" name="movie" type="text" />
    <input name="commit" type="submit" value="Search" /> 
  </form></body></html>
  )
end

post '/result' do
  search_str = params[:movie]

  # Make a request to the omdb api here!
  input = Typhoeus.get("www.omdbapi.com", :params => {:s => search_str})
  j_input = JSON.parse(input.body)


  # Modify the html output so that a list of movies is provided.
  html_str = "<html><head><title>Movie Search Results</title></head><body><h1>Movie Results</h1>\n<ul>"
  
  j_input["Search"].each do |i|
    html_str += "<li><a href=\"/poster/#{i["imdbID"]}\">#{i["Title"]+ " " + i["Year"]}</li></a>"
  end
  

  html_str += "</ul></body></html>"

end

get '/poster/:imdb' do |imdb_id|
  # Make another api call here to get the url of the poster.
  input = Typhoeus.get("www.omdbapi.com", :params => {:i => imdb_id})
  j_input = JSON.parse(input.body)

  html_str = "<html><head><title>Movie Poster</title></head><body><h1>Movie Poster</h1>\n"
  html_str += "<h3><img src = #{j_input["Poster"]}> </h3>"
  html_str += "<br /><a href=\"/\">New Search</a></body></html>"

end

