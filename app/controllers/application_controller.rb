class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper Html
  layout 'application'

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404_ua", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.json { head :not_found }
      format.any  { head :not_found }
    end
  end

end
