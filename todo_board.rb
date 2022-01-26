require_relative "item"
require_relative "list"


class TodoBoard

    def initialize

        @lists = {}

    end

    def get_command

        print "\n please enter a command\n"
        cmd, list_label,*args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @lists[list_label] = List.new(list_label)

        when 'ls'
            print @lists.keys

        when 'showall'
            @lists.values.each { |list| list.print }

        when 'mktodo'
            if @lists[list_label]
                @lists[list_label].add_item(*args)
            else
                @lists[list_label] = List.new(list_label)
                @lists[list_label].add_item(*args)
            end

        when 'up'
            
            @lists[list_label].up(*args.map(&:to_i))

        when 'down'
            @lists[list_label].down(*args.map(&:to_i))

        when 'swap'
            @lists[list_label].swap(*args.map(&:to_i))

        when 'sort'
            @lists[list_label].sort_by_date!

        when 'priority'
            @lists[list_label].print_priority

        when 'print'
            if args.length == 0
                @lists[list_label].print
            else
                @lists[list_label].print_full_item(*args.map(&:to_i))
            end

        when 'purge'
            @lists[list_label].purge

        when 'toggle'
            @lists[list_label].toggle_item(*args.map(&:to_i))
            
        when 'quit'
            return false

        when 'rm'
            @lists[list_label].remove_item(*args.map(&:to_i))

        else
            print "Sorry, that command is not recognized."
        end

        true

    end

    def run

        until self.get_command == false
            if !self.get_command
                print "\nProgram Ended.\n"
                puts '---------------------'
                return nil
            else
                self.get_command
            end
        end

        print "\nProgram Ended.\n"
        puts '---------------------'


    end

end

my_board = TodoBoard.new()

my_board.run