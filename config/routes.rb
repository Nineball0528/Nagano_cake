Rails.application.routes.draw do

  get '/about' => 'public/homes#about'

  namespace :public do
    get 'oreders/index'
    get 'oreders/show'
  end
  namespace :public do
    get 'homes/top'
    get 'customers/show'
    get 'customers/edit'


    resources :items,only:[:index,:show]
    resources :cart_items,only:[:index,:update, :destroy, :create]
    resources :addresses,only:[:index,:edit]

  end

  namespace :admin do
    get 'homes/top'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
 get '/admin' => 'admin/homes#top'
 namespace :admin do
   resources :items,only:[:index,:new,:show,:edit,:create,:update]
   resources :genres,only:[:index,:edit,:create,:update]
   resources :customers,only:[:index,:edit,:show,:update]
   resources :oreders,only:[:show,:update]
   resources :oreder_details,only:[:update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
