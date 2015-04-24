class Cart < ActiveRecord::Base
	belongs_to :user

	scope :bought, -> { where(buy: true) }

	has_many :products

	def add(meal)
		Product.create(cart_id: self.id, meal_id: meal.id)
	end

	def finish(user_id)
		update({buy: true, user_id: user_id, buy_date: Date.today})
	end

end