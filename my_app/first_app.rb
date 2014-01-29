require "sinatra"  #creates params for me
require "sinatra/reloader"

MY_USERS = [ {name: "John"}, {name: "Jane"} ]

get "/users" do

	users = ""

	MY_USERS.each do |user|
		users += "#{user[:name]} <br>"
	end
	users
	
end

get "/users/:id" do
	id = params[:id].to_i
	MY_USERS[id]
end
