require 'net/http'

class NumberFact
  attr_reader :text

  def initialize(number, fact_type, client = Net::HTTP)
    number_fact_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
    @text = client.get(number_fact_uri)
  end

  def self.build(alexa_request, client = Net::HTTP)
    new(alexa_request.slot_value("Number"),
    alexa_request.slot_value("FactTyle"))
  end
  
end
