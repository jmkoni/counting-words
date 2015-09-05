Rails.application.routes.draw do
  resources :scraped_urls
  root 'scraped_urls#index'
end
