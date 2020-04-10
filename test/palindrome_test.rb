require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_form_presence
    get '/palindrome'
    assert doc(last_response).at_css('form')
  end

  def test_non_palindrome_submission
    post '/detect', phrase: "racecor"
    assert_includes doc(last_response).at_css('strong').content, "isn't a palindrome"
    assert doc(last_response).at_css('form')
  end

  def test_palindrome_submission
    post '/detect', phrase: "Anita lava la tina"
    assert_includes doc(last_response).at_css('strong').content, "is a palindrome"
  end
end