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
end