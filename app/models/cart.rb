class Cart < ActiveRecord::Base

	has_many :products

	def add(meal)
		Product.create(cart_id: self.id, meal_id: meal.id)
	end

	def finish
		update({buy: true})
	end

end