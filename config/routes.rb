Rails.application.routes.draw do
  # get 'favorites/index'

  get 'sessions/new'

  root 'pages#index' #トップページのルーティング
  get 'pages/help' #rootであるlocalhost3000:に/pages/helpとURLを指定すると、pages_controllerのhelpメソッドが実行され、viewのhelp.html.erbが実行される。

  get '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
  resources 'comments'

  get '/favorites_post', to: 'favorites#create',as: "favorite_post"
  get '/favorites', to: 'favorites#index'


#resourcesでwebサービスに必要なルーティングを一括で生成
#それによって以下のようなルーティングが一括で生成されます
#下記はHTTPメソッド
# HTTP動詞	URL	コントローラー#アクション
# GET	users	users#index
# GET	users/new	users#new
# POST	users	users#create POSTはUserを新規作成するなどデータを新たに作成する時に使用
# GET	users/:id	users#show
# GET	users/:id/edit	users#edit
# PATCH	users/:id	users#update
# DELETE	users/:id	users#delete


end
