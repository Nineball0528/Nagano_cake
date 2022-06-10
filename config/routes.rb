Rails.application.routes.draw do


  root to:'public/homes#top'
  get '/about' => 'public/homes#about'




  scope module: :public do
    get 'current_customer' => 'customers#show'
    patch '/current_customer' => 'customers#update'
    get 'current_customer/edit' => 'customers#edit'
    get '/current_customer/withdrawal_confirm' => 'customers#withdrawal_confirm'
    patch '/current_customer/withdrawal' => 'customers#withdraw'

    get 'orders/new' => 'orders#new'
    get 'orders' => 'orders#index'
    get 'orders/show'
    get 'orders/:id' => 'orders#show'
    post 'orders' => 'orders#create'
    post '/orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    delete 'cart_items_destroy_all' => 'cart_items#destroy_all'




    resources :items,only:[:index,:show]
    resources :cart_items,only:[:index,:update, :destroy, :create]
    resources :addresses,only:[:index,:update,:create,:edit,:destroy]
  end

  namespace :admin do
    get 'admin' => 'homes#top'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
 namespace :admin do
   root to:'homes#top'
   resources :items,only:[:index,:new,:show,:edit,:create,:update]
   resources :genres,only:[:index,:edit,:create,:update]
   resources :customers,only:[:index,:edit,:show,:update]
   resources :orders,only:[:show,:update]
   resources :order_details,only:[:update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
