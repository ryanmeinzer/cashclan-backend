# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'dotenv/load'
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
twilio_number = ENV['TWILIO_NUMBER']
my_number = ENV['MY_NUMBER']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: "You've been matched! Meet now at the ATM.",
     from: twilio_number,
    #  to: "+#{test_number}"
     to: '+14155988544'
   )

puts message.sid