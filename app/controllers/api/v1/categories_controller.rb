class API::V1::CategoriesController < Faalis::APIController
  before_filter :build_resource, :only => :create
  load_and_authorize_resource :except => [:destory]

  # GET /api/v1/categories
  def index
    respond_with(@categories)
  end

  def create
    
    if @category.save
      respond_with(@category)
    else
      respond_to do |format|
        format.json { render :json => {:fields => @category.errors}, :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_with(@category)
  end

  def update
    

    if @category.update(resource_params)
      respond_with(@category)
    else
      respond_to do |format|
        format.json { render :json => {:fields => @category.errors}, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    ids = params[:id].split(",")
    @categories = ::Category.where(:id => ids)
    authorize! :destroy, @categories
    @categories.destroy_all
  end

  def build_resource
    @category = ::Category.new(resource_params)
  end

  def resource_params
    params.require(:category).permit(:id, :name, :desc)
  end

end
