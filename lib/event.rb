class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(truck)
        @food_trucks << truck
    end

    def food_truck_names
        @food_trucks.map do |truck|
            truck.name
        end
    end

    def food_trucks_that_sell(item)
        trucks_that_sell = []
        @food_trucks.each do |truck|
            if truck.inventory[item] != nil
                trucks_that_sell << truck
            end
        end
        trucks_that_sell
    end

    def sorted_item_list
        name_array = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item, value|
                name_array << item.name
            end
        end
        name_array.uniq.sort
    end

    def total_inventory
        item_array = []
        inventory_hash = {}
        @food_trucks.each do |truck|
            truck.inventory.each do |item, value|
                if !item_array.include?(item)
                    item_array << item
                end
            end
        end
        item_array.each do |item|
            inventory_hash[item] = create_subhash(item)
        end
        inventory_hash
    end

    def create_subhash(item)
        stock = 0
        trucks = []
        @food_trucks.each do |truck|
            if truck.inventory.keys.include?(item)
                trucks << truck
                stock += truck.inventory[item]
            end
        end
        {quantity: stock, food_trucks: trucks}
    end

    def overstocked_items
        overstocked_array = []
        total_inventory.each do |item, subhash|
            if subhash[:food_trucks].count > 1 && subhash[:quantity] > 50
                overstocked_array << item
            end
        end
        overstocked_array
    end

end