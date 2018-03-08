Rails.application.routes.draw do

  resources :answers
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
