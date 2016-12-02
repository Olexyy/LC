class LawsuitsController < ApplicationController
  before_action :set_lawsuit, only: [:show, :edit, :update, :destroy]

  # GET /lawsuits
  # GET /lawsuits.json
  def index
    @lawsuits = Lawsuit.all
  end

  # GET /lawsuits/1
  # GET /lawsuits/1.json
  def show
  end

  # GET /lawsuits/new
  def new
    @lawsuit = Lawsuit.new
  end

  # GET /lawsuits/1/edit
  def edit
  end

  # POST /lawsuits
  # POST /lawsuits.json
  def create
    @lawsuit = Lawsuit.new(lawsuit_params)

    respond_to do |format|
      if @lawsuit.save
        format.html { redirect_to @lawsuit, notice: 'Lawsuit was successfully created.' }
        format.json { render :show, status: :created, location: @lawsuit }
      else
        format.html { render :new }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawsuits/1
  # PATCH/PUT /lawsuits/1.json
  def update
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        format.html { redirect_to @lawsuit, notice: 'Lawsuit was successfully updated.' }
        format.json { render :show, status: :ok, location: @lawsuit }
      else
        format.html { render :edit }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawsuits/1
  # DELETE /lawsuits/1.json
  def destroy
    @lawsuit.destroy
    respond_to do |format|
      format.html { redirect_to lawsuits_url, notice: 'Lawsuit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawsuit
      @lawsuit = Lawsuit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_params
      params.require(:lawsuit).permit(:name, :weight, :subcategory_id_id, :webresource_id_id)
    end
end
