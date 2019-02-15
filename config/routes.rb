Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  #routes user
  resources :users, only: [:create, :show, :update, :destroy] do
    collection do
      get 'index'
      post 'get'
      post 'show'
      put 'update'
      delete 'destroy'
      post 'confirm'
      post 'login'
      post 'email_update'
    end
  end
  #routes input and output employees
  resources :inputandoutput, only: [:create, :show, :update, :destroy] do
    collection do
      get 'index'
      get 'get'
      post 'getId'
      post 'show'
      put 'update'
      delete 'destroy'
    end
  end
  #routes password
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  put 'password/update', to: 'password#update'

end
