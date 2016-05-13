module Slackoff
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
end
