class API::V1::ArticlesController < Faalis::APIController
  before_filter :build_resource, :only => :create
  load_and_authorize_resource :except => [:destory]

  # GET /api/v1/articles
  def index
    respond_with(@articles)
  end

  def create
    
    if @article.save
      respond_with(@article)
    else
      respond_to do |format|
        format.json { render :json => {:fields => @article.errors}, :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_with(@article)
  end

  def update
    

    if @article.update(resource_params)
      respond_with(@article)
    else
      respond_to do |format|
        format.json { render :json => {:fields => @article.errors}, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    ids = params[:id].split(",")
    @articles = ::Article.where(:id => ids)
    authorize! :destroy, @articles
    @articles.destroy_all
  end

  def build_resource
    @article = ::Article.new(resource_params)
  end

  def resource_params
    params.require(:article).permit(:id, :title, :content, :publish, :meta_title, :meta_desc)
  end

end
