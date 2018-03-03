class User < ApplicationRecord
  #モデルはデータをデータベースに入れたり出したりするときに通る関所みたいなもの
  validates :name, presence: true
  #presenseは空白時エラーを出す
  validates :email, presence: true
  validates :password, presence: true

  has_many :topics
  #topicsのミグレーションファイルに下記のようなテーブルを書いてる。
    # create_table :topics do |t|
    # t.integer :user_id
    # t.string :description
    # t.string :image
# で、"has_many :topics"　ではuserに紐づいているtopicsテーブルを持ってくる、かつ、userテーブルはたくさんのtopicsを持ってるはずだから
#"has_many"する。
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source:'topic'
#上記は　紐づけがダブルで起きてる。":favorite_topics"はただの変数。userに紐づいているfavoriteに紐づいているtopicテータを持ってきている。
#favotireのmigrationは下記の通り。
#t.integer :user_id
#t.integer :topic_id
# favorite_topics変数はviews/favorites/index.htmlの中で、
# <% @favorite_topics.each do |topic| %>　で出てくる。

  has_many :comments
  has_many :comment_topics, through: :comments, source:'topic'

  has_secure_password

  # put this to which you want to build your password.
  #you can save your passwoord on column in database named "password_digest"
  #you are enabled to use password and password_confirmation.
  #aslo able to use validation to make sure  presence value consistents value(? don't know what value).
  #引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド、authenticateメソッドが使えるようになる。
end
