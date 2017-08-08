Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  root "static_pages#show", page: "home"
  
  get "/static_pages/:page", to: "static_pages#show"
end
