class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    #現在ログインしているuserを返すメソッド
    #ゲッター。ゲッターはインスタンス変数の値を取得するためのメソッド

    @current_user ||= User.find_by(id: session[:user_id])
    #||= は左辺が未定義もしくは偽なら代入の意味
    # モデル名.find_byは特定の条件にマッチした最初のレコードを取得の意味https://www.sejuku.net/blog/13000参照。
    #ここではsessionで入力されたUserのテーブルのを取得し@current_userに代入している。

  end

  def logged_in?
    !current_user.nil?
  end
end
