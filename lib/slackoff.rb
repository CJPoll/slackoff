require 'net/http'
require 'json'
##
# Represents a single slack instance.
module Slackoff
  class Slack
    def incoming_webhook(url)
      Slackoff::Webhook.new(URI(url))
    end
  end

  class Webhook
    def initialize(uri)
      @uri = URI(uri)
    end

    def send(message)
      connection = Slackoff::HTTPS.new(@uri)
      connection.send message
    end
  end

  class HTTPS
    # URI should already be encoded as a ruby URI
    def initialize(uri)
      @uri = uri
    end

    # body is a hash of data
    def send(post)
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(@uri.request_uri)
      request.body = post.to_json

      response = http.request request

      response
    end
  end

  class Post
    attr_accessor :text, :channel, :username
    def to_json
      body = {}

      body[:text] = @text if @text
      body[:channel] = @channel if @channel
      body[:username] = @username if @username

      body.to_json
    end
  end
end
