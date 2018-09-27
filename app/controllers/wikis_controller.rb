class WikisController < ApplicationController
  #before_action :authenticate_user!, except: :index
  #skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if current_user.standard?
      @wikis = Wiki.where(private: false)
    else
    @wikis = Wiki.all
    #authorize @wikis
  end
  end


  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new

  end

  def edit
    @wiki = Wiki.find(params[:id])
     authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      redirect_to @wiki
    else
      render 'new'
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
     authorize @wiki
    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      render 'edit'
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\"was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end


  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
