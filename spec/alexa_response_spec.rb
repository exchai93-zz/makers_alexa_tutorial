require 'alexa/response'
require 'alexa/request'

RSpec.describe Alexa::Response do
  describe './build' do
    it 'returns a JSON response with session data if provided' do
      expected_response = {
        version: "1.0",
        sessionAttributes: {
          sessionKey: "Session Value"
        },
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello World"
          }
        }
      }.to_json

      session_response = Alexa::Response.build("Hello World", { sessionKey:
        "Session Value" })
        expect(session_response).to eq expected_response
      end
    end
    
    it 'returns a JSON response with a custom string if provided' do
      expected_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Custom String"
          }
        }
      }.to_json

      expect(Alexa::Response.build("Custom String")).to eq expected_response
    end


    it 'returns a minimal JSON response otherwise' do
      minimal_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello World"
          }
        }
      }.to_json

      expect(Alexa::Response.build).to eq minimal_response
    end

  describe '#slot_value' do
    it 'returns the value for a specified slot' do
      # sample of JSON taken from Service Simulator
      request_json = {
        "request": {
          "type": "IntentRequest",
          "intent": {
            "name": "IntentName",
          "slots": {
            "SlotName": {
              "name": "SlotName",
              "value": "10"
            }
          }
        }
      }
    }.to_json
    # mock behaviour of incoming Sinatra request
    # body method that yields a StringIO containing
    # the JSON we are dealing with
    sinatra_request = double("Sinatra::Request", body: StringIO.new(request_json))

    expect(Alexa::Request.new(sinatra_request).slot_value("SlotName")).to eq "10"

    end
  end


end
