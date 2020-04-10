require 'sinatra'
require 'albertoms_palindrome'

get '/' do
  @title = 'Home'
  erb :index
end

get '/about' do
  @title = 'About'
  erb :about
end

get '/palindrome' do
  @title = 'Palindrome Detector'
  erb :palindrome
end

post '/detect' do
  @title = "Palindrome Result"
  @phrase = params[:phrase]
  erb :result
end