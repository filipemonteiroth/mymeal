class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :total_cart

  def my_cart
  	cart = Cart.find(session[:cart_id]) unless session[:cart_id].nil?
  	if (cart.nil?)
  		cart = Cart.create
  		session[:cart_id] = cart.id
  	end
  	cart
  end

  def total_cart
  	total = 0
  	my_cart.products.each do |product|
  		total += product.meal.value
  	end
  	total
  end

end
