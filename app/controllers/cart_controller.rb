class CartController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:add, :finish]

	def add
		meal = Meal.find(params[:id])
		my_cart.add(meal)
		redirect_to "/"
	end

	def finish
		my_cart.finish
		session[:cart_id] = Cart.create.id
		redirect_to "/"
	end

end