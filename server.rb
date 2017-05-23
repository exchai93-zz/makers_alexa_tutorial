require 'sinatra'
require 'json'
require 'net/http'
require 'lib/alexa/response'
require 'lib/number_fact'

post '/' do
  NumberFact.build(Alexa::Request.new(request))
    Alexa::Response.build(number_fact.text)
end


def fetch_number_fact(number, fact_type)
  number_facts_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
  number_fact = Net::HTTP.get(number_facts_uri)
end
