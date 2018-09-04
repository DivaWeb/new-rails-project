class WikisController < ApplicationController
#before_action :authenticate_user!, except: :index
  #skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @wikis = Wiki.all
    #authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
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

    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      render 'edit'
    end
  end

 def destroy
   @wiki = Wiki.find(params[:id])
   @wiki.destroy

   redirect_to wikis_path
 end


  private
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end
