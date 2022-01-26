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

       print @items[0]

    end

    def print
        puts '-------------------------------'
        puts '          Groceries'
        puts '-------------------------------'
        puts 'Index | Item         | Deadline'
        puts '---------------------'
        @items.each_with_index { |item, i| puts "#{i}   | #{item.title}       | #{item.deadline}" }
        puts '---------------------'
    end

    def print_full_item(index)

        item = @items[index]

        if valid_index?(index)
            puts " #{item.title}    #{item.deadline}    #{item.description}"
        end

    end
    
    def print_priority

        item = @items[0]

        if valid_index?(0)
            puts " #{item.title}    #{item.deadline}    #{item.description}"
        end

    end

    def down(index, amount=1)

        if !self.valid_index?(index)
            return false
        end

        i = index
        count = 0
        
        while i < self.size-1 && count < amount
            @items[i], @items[i+1] = @items[i+1], @items[i] 
            i +=1
            count += 1
        end

        true
        
    end


    def up(index, amount=1)

        if !self.valid_index?(index)
            return false
        end

        i = index
        count = 0
        
        while i > 0 && count < amount
            @items[i], @items[i-1] = @items[i-1], @items[i] 
            i -=1
            count += 1
        end

        true
        
    end

    def sort_by_date!

        @items.sort_by! { |item| item.deadline }

    end


end