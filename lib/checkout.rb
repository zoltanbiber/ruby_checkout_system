class Checkout
	attr_accessor :total, :items

	def initialize(promo_code = nil)
		@promo_code = promo_code
		@total = 0
		@items = []
	end

	def scan(item)
		@items << item
		@total += item.price
	end

	def total
		@promo_code ? reduced_total(@total, @promo_code) : "£#{@total}"
	end

	def clear
		@total = 0
		@items = []
	end

	private

	def reduced_total(total, promo_code)
		summer_sale_total(total) if promo_code == 'summer sale'
	end

	def summer_sale_total(total)
		number_of_lavender_hearts = @items.count { |i| i.name == 'Lavender heart'}

		if total >= 60 && number_of_lavender_hearts > 1
			total_minus_lavender_discount = @total - (number_of_lavender_hearts * 0.75)
			"£#{(total_minus_lavender_discount - (total_minus_lavender_discount/10)).round(2)}"
		elsif total >= 60
			"£#{@total - (@total/10)}"
		elsif number_of_lavender_hearts > 1
			"£#{@total - (number_of_lavender_hearts * 0.75)}"
		else
			"£#{@total}"
		end
	end
end
