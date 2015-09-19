module Slackoff
  ##
  # Retrieves slash command data from the params hash
  class SlashData
    attr_reader :token, :team_id, :team_domain, :channel_id, :channel_name,
                :user_id, :user_name, :command, :text

    def initialize(params)
      @token = params[:token]
      @team_id = params[:team_id]
      @team_domain = params[:team_domain]
      @channel_id = params[:channel_id]
      @channel_name = params[:channel_name]
      @user_id = params[:user_id]
      @user_name = params[:user_name]
      @command = params[:command]
      @text = params[:text]
    end
  end
end
