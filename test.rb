require 'typhoeus'

response = Typhoeus.get("www.google.com", :params => {:name => "Tim" })

puts response.body

