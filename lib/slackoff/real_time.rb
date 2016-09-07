module Slackoff
  module RealTime
    START_URI=URI('https://slack.com/api/rtm.start')

    def self.start(token: nil, simple_latest: true, no_unreads: true, mpim_aware: true)
      connection = Slackoff::HTTPS.new(Slackoff::RealTime::START_URI)
      post_data = {
        token: token,
        simple_latest: simple_latest,
        no_unreads: no_unreads,
        mpim_aware: mpim_aware
      }

      connection.post(post_data)
    end
  end
end
