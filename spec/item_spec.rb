require './lib/item.rb'

RSpec.describe Item do

    describe "#initialize" do
        it "exists" do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            
            expect(item1).to be_a(Item)
        end

        it "has a name" do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

            expect(item1.name).to eq('Peach Pie (Slice)')
        end

        it "has a price" do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

            expect(item1.price).to eq("$3.75")
        end
    end
end