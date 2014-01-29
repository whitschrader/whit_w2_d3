require "sinatra"
require "sinatra/reloader"

get "/" do 
	"Hello, world!"	
end

get "/blah" do
	"Blah"
end


get "/Hello" do
	"Hellooooooo"
	end

#get "/my_params/:anything"

get "/hello/:name" do
	"Hello #{params[:name]}" #needs explanation
end


