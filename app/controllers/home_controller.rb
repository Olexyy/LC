class HomeController < ApplicationController
	def index
    message = t(:lorem_ipsum)
    flash.now.notice = message
    flash.now.alert = message
	end
end
