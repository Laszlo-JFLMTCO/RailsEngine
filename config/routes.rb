Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      namespace :customers do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :merchants do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
        get "/most_items" => "merchants_items_business#index"
      end
      namespace :transactions do 
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :invoices do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :invoice_items do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :items do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
        get "/most_items" => "items_most#index"
      end
      resources :merchants, only: [:index, :show] do
        get "/revenue" => "merchant_revenue#index"
      end
      resources :customers, only: [:index, :show] do
        get "favorite_merchant" => "customer_favorites#index"
      end
      resources :transactions, only: [:index, :show]
      resources :invoices, only: [:index, :show] do 
        get "/transactions" => "relationships_invoice_transactions#index"
        get "/invoice_items" => "relationships_invoice_invoice_items#index"
        get "/items" => "relationships_invoice_items#index"
        get "/customer" => "relationship_invoice_customer#index"
        get "/merchant" => "relationship_invoice_merchant#index"
      end
      resources :items, only: [:index, :show] do 
        get "/invoice_items" => "relationships_item_invoice_items#index"
        get "/merchant" => "relationship_item_merchant#index"
        get "/best_day" => "item_best_day#index"
      end
      resources :invoice_items, only: [:index, :show] do
        get "/invoice" => "relationship_invoice_item_invoice#index"
        get "/item" => "relationship_invoice_item_item#index"
      end
    end
  end

end
