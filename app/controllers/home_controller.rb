class HomeController < ApplicationController
  layout 'application'

	def index
    @messages[:danger] = 'Alert message example'
    @messages[:info] = 'Info message example'
    @messages[:warning] = 'Warning message example'
	end

end
