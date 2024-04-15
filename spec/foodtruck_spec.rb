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
end