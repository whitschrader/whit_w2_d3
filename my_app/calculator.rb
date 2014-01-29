require "sinatra"  #creates params for me
require "sinatra/reloader"

# collect input

get "/add/:a/:b" do
	(params[:a].to_i + params[:b].to_i).to_s
end

get "/subtract/:a/:b" do
	(params[:a].to_i - params[:b].to_i).to_s
end

get "/multiply/:a/:b" do
	(params[:a].to_i * params[:b].to_i).to_s
end

get "/divide/:a/:b" do
	(params[:a].to_i / params[:b].to_i).to_s
end

get "/bonus/:a/:b.:c" do
	(params[:a].to_f + (params[:b].to_f) + params[:c].to_f/10.0).to_s
end