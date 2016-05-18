class Promotion
	attr_reader :name

	@instances = []

	def initialize(name)
		@name = name
	end

	def self.all
		@instances
	end

	@instances << lavender_heart_multibuy = new('Lavender heart multibuy')
	def lavender_heart_multibuy.discount(total, items)
		number_of_lavender_hearts = items.count { |i| i.name == 'Lavender heart'}
		number_of_lavender_hearts > 1 ? number_of_lavender_hearts * 0.75 : 0
	end

	@instances << ten_percent_off_sixty = new('10 percent off £60')
	def ten_percent_off_sixty.discount(total, items)
		lavender_discount = self.class.all.select { |i| i.name == 'Lavender heart multibuy'}.first.discount(total, items)
		total >= 60 ? (total - lavender_discount) / 10 : 0
	end
end