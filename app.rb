require "rack"

class HelloWorld

	def call(env)  # 200 is your response code ?? where is env being called into the method?
			[200, {"Content-Type" => "text/html"}, ["Hello World!!"]]
	end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8000



