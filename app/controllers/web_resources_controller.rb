class WebResourcesController < ApplicationController
  before_action :set_web_resource, only: [:show, :edit, :update, :destroy]

  # GET /web_resources
  def index
    @web_resources = WebResource.sorted
  end

  # GET /web_resources/1
  def show
  end

  # GET /web_resources/new
  def new
    @web_resource = WebResource.new
  end

  # POST /web_resources
  def create
    @web_resource = WebResource.new(web_resource_params)

    respond_to do |format|
      if @web_resource.save
        format.html { redirect_to @web_resource, notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # GET /web_resources/1/edit
  def edit
  end

  # PATCH/PUT /web_resources/1
  def update
    respond_to do |format|
      if @web_resource.update(web_resource_params)
        format.html { redirect_to @web_resource, notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /web_resources/1
  def destroy
    @web_resource.destroy
    respond_to do |format|
      format.html { redirect_to web_resources_url, notice: t(:operation_successful) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_resource
      @web_resource = WebResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_resource_params
      params.require(:web_resource).permit(:name, :title, :body, :key, :weight)
    end
end
