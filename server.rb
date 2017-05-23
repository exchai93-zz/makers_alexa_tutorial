require 'sinatra'
require 'json'
require 'net/http'
require 'lib/alexa/response'

post '/' do
  alexa_request = Alexa::Request.new(request)

  number_facts_uri = URI("http://numbersapi.com/#{
  alexa_request.slot_value("Number") }/#{
  alexa_request.slot_value("FactType") }")
  number_fact = Net::HTTP.get(number_facts_uri)

  Alexa::Response.build(number_fact)

end

def fetch_number_fact(number, fact_type)
  number_facts_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
  number_fact = Net::HTTP.get(number_facts_uri)
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
