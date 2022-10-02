class BooksController < ApplicationController

  def new
    @book = Book.new
    # redirect_to '/books'
  end

  def create
    # @message = @book.message.new(massage_params)
    @book = Book.new(book_params)
     if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

def update
     @book = Book.find(params[:id])
# 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
  if @book.update(book_params)
    redirect_to book_path, notice: "Book was successfully updated."
  else
    flash.now[:danger] = "Book wasn't successfully updated."
    render 'edit'
  end
end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end