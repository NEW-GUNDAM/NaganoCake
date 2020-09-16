Rails.application.routes.draw do
   devise_for :customers

   devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
 #↑controllersでカスタマー側とURLを分けてます。

 # customer側ルーティング
  root "products#top"
  get "products/about" => "products#about", as: 'products_about'
  get "customers/usubscribe" => "customers#usubscribe", as: 'customers_usubscribe'
  get "customers/withdraw" => "customers#withdraw", as: 'customers_withdraw'
  resources :products, only: [:index, :show]
  resources :customers, only: [:edit ,:update, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
        delete 'destroy_all'
    end
  end
  get "orders/thanks" => "orders#thanks", as: 'orders_thanks'
  get "orders/comfirm" => "orders#confirm", as: 'orders_comfirm'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only:[:show, :new, :create, :index]

  # admin側ルーティング
  namespace :admins do
    root "devise#new"
    get "admins" => "admins/home", as: 'admins_home'
    resources :products, only: [:new, :show, :index, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_dateils, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_items, only: [:index, :show, :update]
  end
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
