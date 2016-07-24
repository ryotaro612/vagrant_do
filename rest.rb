#!/usr/bin/env ruby
#
require 'rest-client'
require 'json'

puts RestClient.get  'https://api.digitalocean.com/v2/images?page=1&per_page=100', 
	{'Content-Type' => "application/json",  :Authorization => "Bearer #{ENV["DIGITAL_OCEAN_PERSONAL_ACCESS_TOKEN"]}"}

RestClient.get  'https://api.digitalocean.com/v2/sizes', 
	{'Content-Type' => "application/json",  :Authorization => "Bearer #{ENV["DIGITAL_OCEAN_PERSONAL_ACCESS_TOKEN"]}"} { |response, request, result, &block|
  	puts JSON.parse(response)
=begin
	case response.code
  when 200
    p "It worked !"
    response
  when 423
    raise SomeCustomExceptionIfYouWant
  else
    response.return!(request, result, &block)
  end
=end
}

