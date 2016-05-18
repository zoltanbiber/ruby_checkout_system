require 'promotion'

class Checkout
	attr_accessor :total, :items

	def initialize(promotional_rules = false)
		@promotional_rules = promotional_rules
		@total = 0
		@items = []
	end

	def scan(item)
		@items << item
		@total += item.price
	end

	def total
		@promotional_rules ? "£#{total_after_promotion_discounts(@total, @items)}" : "£#{@total}"
	end

	def clear
		@total = 0
		@items = []
	end

	private

	def total_after_promotion_discounts(total, items)
		(total - Promotion.all.each.map { |p| p.discount(total, items) }.inject { |sum, d| sum += d }).round(2)
	end

	# def total_after_promotion_discounts(total)
	# 	number_of_lavender_hearts = @items.count { |i| i.name == 'Lavender heart'}

	# 	if total >= 60 && number_of_lavender_hearts > 1
	# 		total_minus_lavender_discount = @total - (number_of_lavender_hearts * 0.75)
	# 		"£#{(total_minus_lavender_discount - (total_minus_lavender_discount/10)).round(2)}"
	# 	elsif total >= 60
	# 		"£#{@total - (@total/10)}"
	# 	elsif number_of_lavender_hearts > 1
	# 		"£#{@total - (number_of_lavender_hearts * 0.75)}"
	# 	else
	# 		"£#{@total}"
	# 	end
	# end
end
