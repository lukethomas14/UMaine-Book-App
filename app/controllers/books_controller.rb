class BooksController < ApplicationController

  before_filter :authorize, only: [:edit, :update, :new, :create, :destroy]
  # GET /books
  # GET /books.json
  def index
    @books = current_user.books.search(params[:search])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = current_user.books.find(params[:id])
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = current_user.books.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(params[:book])

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render action: "new" 
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = current_user.books.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy

    redirect_to books_url
  end
end
