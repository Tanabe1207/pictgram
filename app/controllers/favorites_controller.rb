class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    #model FavoriteクラスにnewメソッドでFavoriteクラスのインスタンスfavoriteを作っている。
    favorite.user_id = current_user.id
    #favoriteの中身は今は空のテーブルである。また、current_userは
    #apprication_controllerで定義したメソッドで、ログインしている
    #ユーザーのUserテーブルが入っている。
    #ここでは、空のfavoriteテーブルのuser_idに、現在ログインしているユーザーの
    #idを代入している。"favorite.user_id"の"."は、テーブルの中から何か（今回なら
    #user_id）を指定しているのである。データは配列で管理されているので
    #ハッシュを使った配列の中から一つ指定するのと同じ原理。
    favorite.topic_id = params[:topic_id]
    if favorite.save
      redirect_to topics_path, notice: 'お気に入りに登録しました'
    else
      redirect_to topics_path, notice: 'お気に入り登録に失敗しました'
    end
  end

  def index
    @favorite_topics = current_user.favorite_topics
#favorite_topicsはuserモデル内で定義した変数。下記のように定義されてる。
#has_many :favorite_topics, through: :favorites, source:'topic'
#上記から、favorite_topicsの中身はuserに紐づいたfavoritesに紐づいたtopicである。

#current_userはapplication_controller内で定義されているメソッドであり、中身は
#現在ログインしてるユーザーのUserテーブル。

#つまり、"current_user.favorite_topics"は現在ログインしているユーザーのテーブル中から、
#現在ログインしているユーザーがfavoriteしたトピックを引っ張り出してくる　という意味。
#そしてそれを"@favorite_topics"に代入し、viewでeachで表示していく。
  end

end
