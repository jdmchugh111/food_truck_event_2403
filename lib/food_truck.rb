class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def check_stock(item)
        if @inventory[item] == nil
            0
        else
            @inventory[item]
        end
    end

    def stock(item, number)
        if @inventory[item] == nil
            @inventory[item] = number
        else
            @inventory[item] += number
        end
    end

    def potential_revenue
        potential_revenue = 0
        @inventory.each do |item, value|
            potential_revenue += item.price * value
        end
        potential_revenue
    end
        
end