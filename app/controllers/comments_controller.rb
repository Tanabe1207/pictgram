class CommentsController < ApplicationController

  def new
    @comment=Comment.new
    #comment/newでテーブル作成
    #def new はnew.htmlへのrender
    #作ったのは空のテーブル。newで入力する内容を教えてあげてる。
    #ここでは"contents"
  end

  def create
    #この時点ではまだCommentテーブルの中身は空。この下のコードで@commentインスタンス変数に
    #値を入れていく。ちなみに、userのnewで投稿に失敗した場合、名前などが残ってリダイレクトされる。
    #これはrenderして、変数@userの中に値を残したままリダイレクトされるから。一方で
    #redirectメソッドを使うと単純に　　%未記入%
    comment=Comment.new

    comment.user_id=current_user.id
    comment.topic_id=params[:comment][:topic_id] #OK?
    comment.contents=params[:comment][:contents]
    if comment.save
      redirect_to topics_path, notice: 'コメントを投稿しました'
    else
      redirect_to topics_path, notice: 'コメントの投稿に失敗しました'
    end
  end
end

#Favoriteクラスのインスタンス、favoriteを生成する。
#favorite.user_idに現在ログインしているuser(current_user)のidを代入する
#favorite.topic_idにparams[:topic_id]（後述）を代入する
#favoriteをsaveし、その成否によって、条件分岐を行う
#以上のような処理を行うことでそれぞれのUserとTopicに紐付いた、お気に入りの追加を行っています。
