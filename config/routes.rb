Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  namespace :admins do
    get 'order_items/index'
    get 'order_items/show'
    get 'order_items/update'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admins do
    get 'order_datails/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'products/new'
    get 'products/show'
    get 'products/index'
    get 'products/create'
    get 'products/edit'
    get 'products/update'
  end
  namespace :admins do
    get 'homes/top'
  end
  get 'orders/show'
  get 'orders/new'
  get 'orders/thanks'
  get 'orders/create'
  get 'orders/index'
  get 'orders/comfirm'
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'products/index'
  get 'products/show'
  get 'products/about'
  get 'products/top'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/show'
  get 'customers/withdraw'
  get 'customers/unsubscribe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
