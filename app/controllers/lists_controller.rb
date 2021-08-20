class ListsController < ApplicationController

  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    # @bookmark = Bookmark.find(params[:id])
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'The new list was successfully created.'
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
