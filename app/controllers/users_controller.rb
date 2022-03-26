class UsersController < ApplicationController

  # ユーザー一覧表示アクション
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  # ユーザー詳細表示アクション
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  # ユーザー情報編集表示アクション
  def edit
    @user = User.find(params[:id])
    # 他ユーザーが編集できないように設定
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  # ユーザー情報編集アクション
  def update
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  # ユーザー情報データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
