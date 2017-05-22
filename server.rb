require 'sinatra'

post '/' do
  p request.body.read
end
