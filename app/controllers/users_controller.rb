class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    @user = User.new
  end
  
def edit
  @user = User.find(params[:id])
end

  def update
  @user = User.find(params[:id])
   if  @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path 
      flash[:success] = "プロフィールを更新しました"
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'users/:id/edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "会員登録が完了しました"
    else
      render 'new'
    end
  end
  
  def show
    @items = @user.items.group('items.id')

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,
                                 :furigana,:post_num,:prefectures,
                                 :municipality,:area,:tel,:fax,:building)
  end
end

