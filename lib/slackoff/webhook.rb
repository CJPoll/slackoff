require 'slackoff/https'
module Slackoff
  class Webhook
    def initialize(uri)
      @uri = URI(uri)
    end

    def send(message)
      connection = Slackoff::HTTPS.new(@uri)
      connection.send message
    end
  end
end
