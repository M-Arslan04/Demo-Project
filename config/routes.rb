Rails.application.routes.draw do
  root 'admin_panel#index'
  get 'admin_panel/index'

  # get 'admin/user/index'

  namespace :admin do
    resources :users
  end
  resources :leads do
    resources :phases do
      resources :comments, module: :phases
    end
    resources :comments, module: :leads
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
