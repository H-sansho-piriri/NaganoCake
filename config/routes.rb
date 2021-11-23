Rails.application.routes.draw do

  # 管理者側
  namespace :admin do
    resources :products, except: [:destroy]
    resources :categories, except: [:show, :destroy, :new]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  # 顧客側
  scope module: :public do

    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :products, only: [:index, :show]

    resource :customers, only: [:show, :edit, :update] do
      collection do
        get "unsubscribe"
        patch "withdraw"
      end

      resources :cart_products, only: [:index, :create, :update, :destroy] do
        collection do
          delete "destroy_all"
        end
      end

      resources :shippings, except: [:new, :show]

    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post "confirm"
        get "complete"
      end
    end
  end
  
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # 顧客側
  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
end