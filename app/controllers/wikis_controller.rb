class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = policy_scope(Wiki).find(params[:id])
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
    authorize wiki
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
