#!/usr/bin/env ruby

require 'twitter'
require 'sinatra'

USERNAME = 'WRBB-On-Air'.freeze

client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'YOUR_CONSUMER_KEY'
  config.consumer_secret = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_SECRET'
end

client.user(USERNAME)

get '/nowplaying' do
  
  ####################
  ####   Params  #####
  ####################
  # song => Song title
  # artist => Artist name
  # playlist => Playlist id
  # show => Show name
  # dj => DJ name

  tweet = "now playing #{params['song']} by #{params['artist']}"
  client.update(tweet)
end
