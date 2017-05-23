require 'sinatra'
require 'json'
require 'net/http'
require 'lib/alexa/response'

post '/' do
  parsed_request = JSON.parse(request.body.read)
  number = parsed_request["request"]["intent"]["slots"]["number"]["value"]
  fact_type = parsed_request["request"]["intent"]["slots"]["FactType"]["value"]

  number_facts_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
  number_fact = Net::HTTP.get(number_facts_uri)

  Alexa::Response.build(number_fact)

end


# post '/' do
#   {
#    version: "1.0",
#    response: {
#      outputSpeech: {
#        type: "PlainText",
#        text: "Hello World"
#      }
#    }
#  }.to_json
# end
