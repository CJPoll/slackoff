require 'net/http'
require 'json'
##
# Represents a single slack instance.
module Slackoff
  class Slack
    def incoming_webhook(url)
      uri = URI(url)
      connection = Slackoff::HTTPS.new(uri)
      connection
    end
  end

  class HTTPS
    # URI should already be encoded as a ruby URI
    def initialize(uri)
      @uri = uri
    end

    # body is a hash of data
    def send(body)
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(@uri.request_uri)
      request.body = body.to_json
      response = http.request request
      return response
    end
  end
end
