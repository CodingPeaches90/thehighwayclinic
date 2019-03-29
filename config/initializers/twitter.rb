# Reference : https://stackoverflow.com/questions/40023816/how-to-call-twitter-gem-methods-on-the-twitter-api-client-in-the-view-file
$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end
