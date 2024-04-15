require 'spec_helper'

RSpec.describe Event do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")  
        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
        @food_truck3 = FoodTruck.new("Palisade Peach Shack") 
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end
    describe "#initialize" do
        it "exists" do
            expect(@event).to be_a(Event)
        end

        it "has a name" do 
            expect(@event.name).to eq("South Pearl Street Farmers Market")
        end

        it "defaults food_trucks to an empty bracket" do
            expect(@event.food_trucks).to eq([])
        end
    end

    describe "#add_food_truck" do
        it "can add trucks to food_trucks array" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
        end
    end

    describe "#food_truck_names" do
        it "can return all truck names" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        end
    end

    describe "#food_trucks_that_sell" do
        it "can return list of trucks that sell item" do
            @food_truck1.stock(@item1, 30)
            @food_truck3.stock(@item1, 65)
            @food_truck2.stock(@item4, 50)
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
            expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
        end
    end

    describe "#sorted_item_list" do
        it "can return alphabetical array of items with no duplicates" do
            @food_truck1.stock(@item1, 30)
            @food_truck1.stock(@item2, 30)
            @food_truck1.stock(@item3, 30)
            @food_truck1.stock(@item4, 30)
            @food_truck2.stock(@item1, 50)
            @food_truck2.stock(@item2, 50)
            @food_truck3.stock(@item3, 65)
            @food_truck3.stock(@item4, 65)
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.sorted_item_list).to eq(['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"])
        end
    end

    describe "#create_subhash" do
        it "can create the subhash for total_inventory" do
            @food_truck1.stock(@item1, 30)
            @food_truck1.stock(@item2, 30)
            @food_truck1.stock(@item3, 30)
            @food_truck1.stock(@item4, 30)
            @food_truck2.stock(@item1, 50)
            @food_truck2.stock(@item2, 50)
            @food_truck3.stock(@item3, 65)
            @food_truck3.stock(@item4, 65)
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.create_subhash(@item1)).to eq({quantity: 80, food_trucks: [@food_truck1, @food_truck2]})
        end
    end

    describe "#total_inventory" do
        it "can return hash with inventory of all items" do
            @food_truck1.stock(@item1, 30)
            @food_truck1.stock(@item2, 30)
            @food_truck1.stock(@item3, 30)
            @food_truck1.stock(@item4, 30)
            @food_truck2.stock(@item1, 50)
            @food_truck2.stock(@item2, 50)
            @food_truck3.stock(@item3, 65)
            @food_truck3.stock(@item4, 65)
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected_hash ={@item1 => {quantity: 80, food_trucks: [@food_truck1, @food_truck2]},
                            @item2 => {quantity: 80, food_trucks: [@food_truck1, @food_truck2]},
                            @item3 => {quantity: 95, food_trucks: [@food_truck1, @food_truck3]},
                            @item4 => {quantity: 95, food_trucks: [@food_truck1, @food_truck3]}}

            expect(@event.total_inventory).to eq(expected_hash)
        end
    end
            
end
