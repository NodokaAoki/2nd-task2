class SearchController < ApplicationController
  def search
  	@book = Book.new
  	if params[:target] == "1" #User検索
  		@target = "user"

  		if params[:range] == "1" #完全一致
  			@users = User.where("name Like ?","#{params[:keyword]}")
  		elsif params[:range] == "2" #前方一致
  			@users = User.where("name Like ?", "#{params[:keyword]}%")
  		elsif params[:range] == "3" #後方一致
  			@users = User.where("name Like ?", "%#{params[:keyword]}")
  		elsif params[:range] == "4" #部分一致
  			@users = User.where("name Like ?", "%#{params[:keyword]}%")
  		else
  			@users = User.all
  		end

  	else #Book検索
  		@target = "book"

  		if params[:range] == "1" #完全一致
  			@books = Book.where("title Like ?","#{params[:keyword]}")
  		elsif params[:range] == "2" #前方一致
  			@books = Book.where("title Like ?", "#{params[:keyword]}%")
  		elsif params[:range] == "3" #後方一致
  			@books = Book.where("title Like ?", "%#{params[:keyword]}")
  		elsif params[:range] == "4" #部分一致
  			@books = Book.where("title Like ?", "%#{params[:keyword]}%")
  		else
  			@books = Book.all
  		end

  	end
  end
end
