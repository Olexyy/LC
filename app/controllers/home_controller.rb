class HomeController < ApplicationController
	def index
    message = t(:lorem_ipsum)
    flash.now.notice = message
    flash.now.alert = message
  end
  def lawsuits_list
    @categories = Category.sorted
  end
end
