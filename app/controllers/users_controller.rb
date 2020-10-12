class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    # バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      # 保存されなければ、newに戻る
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
