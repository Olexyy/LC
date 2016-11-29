class HomeController < ApplicationController

  layout 'application'
	def index
		@flash = {:message => 'Message example'}
	end

end
