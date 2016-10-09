require "httparty"

token = 'cd18a8f50ff58d81b1fd430bbba550fe'
url = 'http://localhost:3000/api/projects/1/tickets/2.json'

response = HTTParty.get(url,
  headers: {
    "Authorization" => "Token token=#{token}"
  }
)

puts response.parsed_response