module Slackoff
  class HTTPS
    # URI should already be encoded as a ruby URI
    def initialize(uri)
      @uri = uri
    end

    def post(data)
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(@uri.request_uri)
      request.body = data

      response = http.request request

      response
    end
  end
end
