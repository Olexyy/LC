class HomeController < ApplicationController
	def index
    message = t(:hello_world)
    flash.notice = message
    flash.alert = message
	end
end
