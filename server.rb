require 'sinatra'
require 'json'
require 'net/http'

post '/' do
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
