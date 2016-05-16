require 'item'

RSpec.describe Item, "Items" do

	let(:item001) 	{ Item.new('001', 'Lavender heart', 9.25) }

	it 'should be aware of their own code, name and price' do
		expect(item001.code).to eq('001')
		expect(item001.name).to eq('Lavender heart')
		expect(item001.price).to eq(9.25)
	end
end
