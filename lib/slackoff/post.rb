##
# Represents a single slack instance.
module Slackoff
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

