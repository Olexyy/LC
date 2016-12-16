class TextStylesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_text_style, only: [:show, :edit, :update, :destroy]

  # GET /text_styles
  def index
    @text_styles = TextStyle.sorted
  end

  # GET /text_styles/1
  def show
  end

  # GET /text_styles/new
  def new
    @text_style = TextStyle.new
  end

  # GET /text_styles/1/edit
  def edit
  end

  # POST /text_styles
  # POST /text_styles.json
  def create
    @text_style = TextStyle.new(text_style_params)

    respond_to do |format|
      if @text_style.save
        format.html { redirect_to @text_style, notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /text_styles/1
  def update
    respond_to do |format|
      if @text_style.update(text_style_params)
        format.html { redirect_to @text_style, notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /text_styles/1
  # DELETE /text_styles/1.json
  def destroy
    @text_style.destroy
    respond_to do |format|
      format.html { redirect_to text_styles_url, notice: t(:operation_successful) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_style
      @text_style = TextStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_style_params
      params.require(:text_style).permit(:name, :weight, :tag, :margin_left, :text_align, :strong, :underline, :italic)
    end
end
