class HomeController < ApplicationController
	def index
    message = t(:lorem_ipsum)
    flash.notice = message
    flash.alert = message
	end
end
