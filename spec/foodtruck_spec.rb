require 'spec_helper'

RSpec.describe FoodTruck do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
    end
    describe "#initialize" do
        it "exists" do
            expect(@food_truck).to be_a(FoodTruck)
        end

        it "has a name" do
            expect(@food_truck.name).to eq("Rocky Mountain Pies")
        end

        it "has a inventory that defaults to an empty hash" do
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe "#check_stock" do
        it "defaults to zero" do
            expect(@food_truck.check_stock(@item1)).to eq(0)
        end

        it "updates to reflect current stock" do
            @food_truck.stock(@item1, 30)

            expect(@food_truck.check_stock(@item1)).to eq(30)

            @food_truck.stock(@item1, 25)

            expect(@food_truck.check_stock(@item1)).to eq(55)
        end
    end

    describe "#stock" do
        it "updates inventory hash" do
            @food_truck.stock(@item1, 30)

            expect(@food_truck.inventory).to eq({@item1 => 30})
        end

        it "adds to existing stock" do
            @food_truck.stock(@item1, 30)
            @food_truck.stock(@item1, 25)

            expect(@food_truck.check_stock(@item1)).to eq(55)
        end
    end
end