require 'checkout'
require 'shopping_basket'

RSpec.describe Checkout, "The checkout process" do

	let(:item001)		{ Item.new('001', 'Lavender heart', 9.25) }
	let(:item002)		{ Item.new('002', 'Personalised cufflinks', 45.00) }
	let(:item003)		{ Item.new('003', 'Kids T-shirt', 19.95) }
	let(:basket1)		{ ShoppingBasket.new(item001, item002, item003) }
	let(:basket2)		{ ShoppingBasket.new(item001, item003, item001) }
	let(:basket3)		{ ShoppingBasket.new(item001, item002, item001, item003) }
	let(:co)				{ Checkout.new() }

	it 'should scan each item without errors' do
		expect { basket1.items.each { |item| co.scan(item) }}.not_to raise_error
	end

	it 'should add up the total price' do
		basket1.items.each { |item| co.scan(item) }
		expect(co.total).to eq('£74.2')

		co.clear

		basket2.items.each { |item| co.scan(item) }
		expect(co.total).to eq('£38.45')

		co.clear

		basket3.items.each { |item| co.scan(item) }
		expect(co.total).to eq('£83.45')
	end

	describe 'apply a promotional discount' do
		let(:co) { Checkout.new('summer sale') }

		it 'should deduct the discount from the total price' do
			basket1.items.each { |item| co.scan(item) }
			expect(co.total).to eq('£66.78')

			co.clear

			basket2.items.each { |item| co.scan(item) }
			expect(co.total).to eq('£36.95')

			co.clear

			basket3.items.each { |item| co.scan(item) }
			expect(co.total).to eq('£73.76')
		end
	end
end
