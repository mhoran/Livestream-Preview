LivestreamPreview::Application.routes.draw do
  root :to => 'channels#show'

  resource :channels
end
