require 'sinatra'
require 'json'
require 'net/http'
require 'lib/alexa/response'
require 'lib/number_fact'

post '/' do
  alexa_request = Alexa::Request.new(request)
  number_fact = NumberFact.new(alexa_request.slot_value("Number"),
  alexa_request.slot_value("FactType"))
    Alexa::Response.build(number_fact.text)
end


def fetch_number_fact(number, fact_type)
  number_facts_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
  number_fact = Net::HTTP.get(number_facts_uri)
end
