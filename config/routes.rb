DemocracyOnline3::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"} do
    get '/users/sign_in' , :to => 'devise/sessions#new'  
    get '/users/sign_out', :to => 'devise/sessions#destroy'
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
 
  

  root :to => 'proposals#index'
  
  #match ':controller/:action/:id'
  
  resources :users do
    collection do
      get :confirm_credentials
    end
  end                                      
  
  #resources :proposal_comments
  match ':controller/:id/:action'
  resources :proposals do
    collection do
      get :index_accepted
    end
    resources :proposal_comments do
      member do
        get :rankup
        get :rankdown
        get :set_votation_date
      end
    end
    member do
      get  :rankup
      get :rankdown
      get :statistics
      post :set_votation_date
    end
  end
  
  resources :proposalcategories
  
  resources :blogs do 
    resources :blog_posts do
      match :tag, :on => :member
      match :drafts, :on => :collection 
      resources :blog_comments
    end
  end
  
  resources :blog_posts
  
 
  resources :events 
  
  #match '/groups/partecipation_request_confirm', :to => 'groups#partecipation_request_confirm'
  
  resources :groups do
    member do
      get :ask_for_partecipation
      get :ask_for_follow
      get :partecipation_request_confirm
    end

    collection do
    end
  end

  
  match ':controller/:action/'
    
  resources :admin
  match 'admin_panel', :to => 'admin#show', :as => 'admin/panel'

  match '/votation/', :to => 'votations#show'
  match '/votation/vote', :to => 'votations#vote'
  resources :votations

  match ':controller/:action/:id'
  
 
  
  match ':controller/:action/:id.:format'
  
#  map.resources :blogs,
  
   match 'index_by_category', :to => 'proposals#index_by_category', :as => '/proposals/index_by_category'
  # match 'index_accepted', :to => 'proposals#index_accepted', :as => '/proposals/index_accepted'
  # match 'activate', :to  => 'users#activate', :as => '/activate/:activation_code'
   
  #  map.signup '/signup', :controller => 'users', :action => 'new'
#    map.login  '/login', :controller => 'sessions', :action => 'new'
 #   map.logout '/logout', :controller => 'sessions', :action => 'destroy'
#   match 'forgot_password', :to => 'users#forgot_password', :as => '/forgot_password'
  #  map.reset_password '/reset_password/:id', :controller => 'users', 
    #                                          :action => 'reset_password'       
                                              
 #   map.new_session '/login', :controller => 'sessions', :action => 'new'                 
end