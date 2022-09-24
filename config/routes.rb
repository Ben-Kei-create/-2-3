Rails.application.routes.draw do
  
  root :to => 'homes#top'
  resources :books
  resources :posts, only: [:create, :new, :edit, :update, :destroy]
  resources :patch, only: [:edit, :update]
  patch'books/:id' => 'books#update', as: 'update_book'

end

# どうして、books/:idなのか？編集機能を追加するのは、books/:id/edit画面のはずなのに。
#   get 'books/new'
#   get 'top'=>'homes#top'
#   post'books'=>'books#create'
#   右はURLである。右は、booksというディレクトリの中のindexアクション
#   get 'books' => 'books#index'
#   get 'books/:id' => 'books#show', as: 'book'
#   get 'books/:id/edit' => 'books#edit', as: 'edit_book'
#   patch'books/:id' => 'books#update', as: 'update_book'
# get 'books/new'
# post 'books' => 'books#create'
# get 'books' => 'books#index'
# get 'books/:id' => 'books#show', as: 'book'
# get 'books/:id/edit' => 'books#edit', as: 'edit_book'
# patch'books/:id' => 'books#update', as: 'update_book'
# delete'books/:id'=>'books#destroy',as: 'destroy_book'