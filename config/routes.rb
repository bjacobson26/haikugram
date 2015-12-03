Rails.application.routes.draw do

  root to: "haikus#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :haikus

end
