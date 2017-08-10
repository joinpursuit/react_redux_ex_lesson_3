class LinksController < ApplicationController
  def new
    if logged_in?
      @link = Link.new
      render :new
    else
      redirect_to new_session_url
    end
  end

  def create
    redirect_to new_session_url if logged_in? == false

    link = Link.new(link_params)

    if link.save
      redirect_to link_url(link)
    else
      flash.now[:errors] = link.errors.full_messages
      render :new
    end
  end

  def index
    @links = Link.all
    render :index
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
