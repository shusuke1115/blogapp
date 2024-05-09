Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
#     resourcesとresourceの相違点について
# 大きな違いは2つあり、それは
# ①indexアクションがあるかないか
# ②urlに:idを含むかどうか
# です。
# コメントにデストロイ機能をつけようとするとコメントにidがつく
    # コメントは特定の記事に対して何個も追加できる
    resources :comments, only: [:new, :create]
    # 自分にとって特定の記事にたいして一個しか言い値がないからresource
    resource :like, only: [:create, :destroy]
  end
  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
