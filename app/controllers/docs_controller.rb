class DocsController < ApplicationController

  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.all.order("created_at DESC")
  end

  def show
  end

  def new
    # instance var only for the view template
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)
    if @doc.save
      # take us to the doc that's just been created
      redirect_to @doc
    else
      # render not redirect so that form wont be blank but filled with previous entries; redirect will delete everything on the page
      render 'new'
    end
  end

  def edit     
  end

  def update
    if @doc.update(doc_params)
      # take us to the document that's just been updated
      redirect_to @doc
    else
      render 'edit'
    end
  end

  # def delete
    
  # end

  def destroy
    @doc.destroy
    # take us to the list of docs
    redirect_to docs_path     
  end

  private

    def find_doc
      @doc = Doc.find(params[:id])
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
    end
end
