Rails.application.routes.draw do

  # devise使用時、URLにusersを含む
  devise_for :users
  # topのルートページ設定
  root to: "homes#top"
  # aboutページのルーディング設定
  get 'home/about' => "homes#about"
  # usersアクションのルーディング
  resources :users, only: [:index, :show, :edit, :update]
  # booksアクションのルーディング
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]

end
