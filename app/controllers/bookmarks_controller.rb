class BookmarksController < ApplicationController

  # before_action :set_list, only: [:new, :create]

  # GET /bookmarks/new
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # POST /bookmarks
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to @list, notice: 'The new bookmark was successfully created.'
    else
      render :new
    end
  end

  private

  # def set_list
  #   @list = List.find(params[:list_id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
