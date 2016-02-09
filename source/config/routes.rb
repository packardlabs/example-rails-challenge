Rails.application.routes.draw do
  resources :charges
  root to: redirect('/charges')
end
