class CartController < ApplicationController
	before_action :verify_user, only: [:finish]
	before_action :verify_admin, only: [:buys]
	skip_before_filter :verify_authenticity_token, :only => [:add, :finish]

	def add
		meal = Meal.find(params[:id])
		my_cart.add(meal)
		redirect_to "/"
	end

	def finish
		my_cart.finish(current_user.id)
		session[:cart_id] = Cart.create.id
		redirect_to "/"
	end

	def buys
		@carts = Cart.bought
	end

	private
		def verify_user
	    redirect_to "/users/sign_up" if current_user.nil?
	  end
		def verify_admin
	    redirect_to "/" unless is_admin?
	  end

end