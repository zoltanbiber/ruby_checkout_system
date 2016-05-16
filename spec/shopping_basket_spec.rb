require 'shopping_basket'

RSpec.describe Item, "ShoppingBasket" do

	let(:item001)		{ Item.new('001', 'Lavender heart', 9.25) }
	let(:item002)		{ Item.new('002', 'Personalised cufflinks', 45.00) }
	let(:item003)		{ Item.new('003', 'Kids T-shirt', 19.95) }
	let(:basket1)		{ ShoppingBasket.new(item001, item002, item003) }

	it 'should know about the items it contains' do
		expect(basket1.items.count).to eq(3)
		expect(basket1.items.include?(item002)).to be true
		expect(basket1.items.first.name).to eq('Lavender heart')
		expect(basket1.items[1].price).to eq(45.00)
		expect(basket1.items[2].code).to eq('003')
	end
end
