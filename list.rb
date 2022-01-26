require_relative "item"

class List

    attr_accessor :label

    def initialize(label)

        @label = label
        @items = []

    end

    def add_item(title, deadline, description=" ")

        @items << Item.new(title, deadline, description)
        return true

    end

    def size

        @items.length
    end

    def valid_index?(index)

        index >= 0 && index < self.size

    end

    def swap(index_1, index_2)

        if valid_index?(index_1) && valid_index?(index_2) 
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end

        false

    end

    def [](index)

        if !valid_index?(index)
            return nil
        end

        @items[index]

    end 


    def priority

        @items[0]

    end
    


end