class WebResourcesController < ApplicationController
  before_action :set_web_resource, only: [:show, :edit, :update, :destroy]

  # GET /web_resources
  # GET /web_resources.json
  def index
    @web_resources = WebResource.all
  end

  # GET /web_resources/1
  # GET /web_resources/1.json
  def show
  end

  # GET /web_resources/new
  def new
    @web_resource = WebResource.new
  end

  # GET /web_resources/1/edit
  def edit
  end

  # POST /web_resources
  # POST /web_resources.json
  def create
    @web_resource = WebResource.new(web_resource_params)

    respond_to do |format|
      if @web_resource.save
        format.html { redirect_to @web_resource, notice: 'Web resource was successfully created.' }
        format.json { render :show, status: :created, location: @web_resource }
      else
        format.html { render :new }
        format.json { render json: @web_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_resources/1
  # PATCH/PUT /web_resources/1.json
  def update
    respond_to do |format|
      if @web_resource.update(web_resource_params)
        format.html { redirect_to @web_resource, notice: 'Web resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_resource }
      else
        format.html { render :edit }
        format.json { render json: @web_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_resources/1
  # DELETE /web_resources/1.json
  def destroy
    @web_resource.destroy
    respond_to do |format|
      format.html { redirect_to web_resources_url, notice: 'Web resource was successfully destroyed.' }
      format.json { head :no_content }
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
