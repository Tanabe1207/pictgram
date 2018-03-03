class UsersController < ApplicationController
  def new
    @user=User.new
    #Userクラスからnewメソッドでインスタンスを生成してる。
    #Userクラスはモデルuser.rbの中にあり、別のクラスのApplicationRecordの継承を受けている。
    #newメソッドはクラスメソッドの一つであり、ApplicationRecord内に定義されている。
    #new methodは一人分のデータ入れ物を塊を一つつくること。create methodならnewとsaveを同時にできる
    #new.html.erbに紐づいたformを作りたいので、インスタンス変数にUserを格納。
    #then rendered on viewer "new.html.erb"
  end

  def create
    @user=User.new(user_params)#strong parameterに定義されている
#viewから送られてきたデータは、newメソッドの中身に入り、インスタンス変数の@userに入る。
#routes.rbで、POSTメソッド（HTTPメソッドの一つ）POST	users	users#createを指示しているから、
#createを実行するとデータがデータベースに保存される。
    if @user.save
      redirect_to root_path, notice:'登録が完了しました'#saveできたらroot pathに飛ぶの意
    else
      flash.now[:alert]="登録に失敗しました"#noticeとalertは自動的にRailsに格納されているflashという変数の中に入ります。
      #<%= flash[:alert] %>でviewの中でアクセスできる。
      render :new #renderは呼び出すviewを指定する。
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
