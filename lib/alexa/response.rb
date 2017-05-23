require 'json'

module Alexa
  class Response
    def self.build
      {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Hello World"
          }
        }
      }.to_json
    end
  end
end
