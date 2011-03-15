LivestreamPreview::Application.routes.draw do
  root :to => 'channels#index'

  resources :channels, :only => :index
  match 'channels/pages/:page', :to => 'channels#index', :as => 'paged_channels'
end
