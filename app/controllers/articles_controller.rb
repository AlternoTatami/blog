class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new    
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def create

    #este se realizo para poder visualizarr en la consala los parametros
    #render plain: params[:article].inspect

    #Article esla Clase del modelo
    @article = Article.new(article_params)
        
    if @article.save
      redirect_to @article
      #redireciona a una URL con nombre para este registro
      #en este caso a Show envianmdo el parametro del id de articulo
    else
      
      if @article.errors.any?
        puts "malooooooooooooooooooo"
      end  

      render "new"
      #El método render se utiliza para que el @artículo El objeto se devuelve a la plantilla "nueva" cuando se procesa
      
    end

  end

  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  



  private
  #s se crea como metoodo privado para accederlo en multiples acciones del controlador
  def article_params
    params.require(:article).permit(:title, :text)
  end


end
