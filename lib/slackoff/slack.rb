require 'slackoff/webhook'

module Slackoff
  class Slack
    def incoming_webhook(url)
      Slackoff::Webhook.new(URI(url))
    end
  end
end
