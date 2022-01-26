
class Item

    attr_accessor :title, :description, :done

    attr_reader :deadline

    def initialize(title, deadline, description)

        @title = title
        @description = description
        @done = false

        if Item.valid_date?(deadline)
            @deadline = deadline.split('-').map(&:to_i).join('-')
        else
            return false
        end


    end

    def deadline=(deadline)

        if self.valid_date?(deadline)
            @deadline = deadline.split('-').map(&:to_i).join('-')
        end

    end

    def toggle

        if self.done == false
            self.done = true
        else
            self.done = false
        end

    end


    def self.valid_date?(date_string)

        date_parts = date_string.split('-')
        
        if date_parts.length == 3 && 
        date_parts[0].length == 4 &&
        date_parts[1].length == 2 &&
        date_parts[2].length == 2

            date_parts_i = date_parts.map(&:to_i)

            if date_parts_i[0] <= 3000 &&
                date_parts_i[1] <= 12 &&
                date_parts_i[2] <= 31

                return true
            end
        end

        raise "Not a valid date"
        return false

    end

end