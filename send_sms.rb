# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'dotenv/load'
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: "You've been matched! Meet now at the ATM.",
     from: '+14159805035',
     to: '+12152857321'
   )

puts message.sid
