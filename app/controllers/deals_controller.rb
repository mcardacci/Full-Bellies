class DealsController < ApplicationController

	def index
	end
	
	def show
		@price_header = "($00.50)"
		@price_btn = 50
	end
	
end