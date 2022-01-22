class BookmarksController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @bookmark = Bookmark.new
  end
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = @list
  if @bookmark.save
    redirect_to list_path(@list)
  else
    render template: 'lists/show'
  end
end

def destroy
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
  redirect_to root_path
end

private

def find_list
  @list = List.find(params[:list_id])
end

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end
