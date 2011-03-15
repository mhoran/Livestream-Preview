class ChannelsController < ApplicationController
  def show
    @page = (params[:page] || 1).to_i
    @channels = Channel.most_popular_channels(@page)
  end
end
