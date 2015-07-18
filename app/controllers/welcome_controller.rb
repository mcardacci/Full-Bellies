class WelcomeController < ApplicationController
	def index
    @user = User.new
    @vendor = Vendor.new
	end

  def about
  end
end
