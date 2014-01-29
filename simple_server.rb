
# Require the Webrick server
require "webrick"

# Get the path for the server using the relative directory sepcified
root = File.expand_path(".") #where you're currently at

# Create a new instance of a webrick server
# and pass it two params
# : Port is the port we'll access it at the browswer

server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root
# Go to localhost:8000

#mount_proc is a method that associates with the object server
server.mount_proc "/hello" do |req, res|
	res.body = "#{req}"
end

trap "INT" do 
	server.shutdown
end

server.start

