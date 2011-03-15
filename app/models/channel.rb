class Channel
  include HTTParty

  base_uri 'channelguide.api.livestream.com'
  default_params :affiliateId => 2065, :applicationKey => '40dea23023e15c6730a6db8a069c60b0b4dbb646'
  
  def self.most_popular_channels(page_number = 1, results_per_page = 9)
    response = get('/programguide',
                   :query => {:method => 'getMostViewedChannels',
                     :pageNumber => page_number,
                     :resultsPerPage => results_per_page,
                     :mostViewedChannelType => 'NOW'})

    return [] unless response.success?

    response.parsed_response['response']['channels']['channel'].map do |channel|
      new(:id => channel['id'],
          :short_name => channel['shortName'],
          :full_name => channel['fullName'],
          :logo_url => channel['logoURL'],
          :live => channel['live'])
    end
  end

  attr_accessor :id, :short_name, :full_name, :logo_url

  def initialize(params = {})
    @id = params[:id].to_i
    @short_name = params[:short_name].to_s
    @full_name = params[:full_name].to_s
    @logo_url = params[:logo_url].to_s
    @live = params[:live] == 'true'
  end

  def live?
    @live
  end

  def url
    "http://livestream.com/#{short_name}"
  end
end
