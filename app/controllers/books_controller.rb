class BooksController < ApplicationController

  # 投稿一覧表示アクション
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  # 投稿詳細表示アクション
  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end

  # 新規投稿アクション
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
    if  @book.save
      redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @books = Book.all
      render :index
    end
  end

  # 投稿編集表示アクション
  def edit
    @book = Book.find(params[:id])
    # 他ユーザーが編集できないように設定
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end

  # 投稿編集アクション
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
    redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  # 投稿削除アクション
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
