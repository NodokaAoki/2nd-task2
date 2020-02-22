class BookCommentsController < ApplicationController
  def create
  	book = Book.find(params[:book_id])
  	@comment = current_user.book_comments.new(book_comment_params)
  	@comment.book_id = book.id
  	if @comment.save
  	redirect_back(fallback_location: root_path)
  	else
  		@book = Book.find(params[:book_id])
      @newbook = Book.new
      session[:error] = @comment.errors.full_messages
      session[:error_count] = @comment.errors.count
      redirect_back(fallback_location: root_path)
  	end
  end

  def destroy
	comment = BookComment.find(params[:id])
  	comment.destroy
  	redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
  	params.require(:book_comment).permit(:comment)
  end

end
