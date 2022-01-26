require_relative "item"
require_relative "list"


class TodoBoard

    def initialize(label)

        @list = List.new(label)



    end

    def get_command

        print "\n please enter a command\n"
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)

        when 'up'
            @list.up(*args.map(&:to_i))

        when 'down'
            @list.down(*args.map(&:to_i))

        when 'swap'
            @list.swap(*args.map(&:to_i))

        when 'sort'
            @list.sort_by_date!

        when 'priority'
            @list.print_priority

        when 'print'
            if args.length == 0
                @list.print
            else
                @list.print_full_item(*args.map(&:to_i))
            end

        when 'purge'
            @list.purge

        when 'toggle'
            @list.toggle_item(*args.map(&:to_i))
            
        when 'quit'
            return false

        when 'rm'
            @list.remove_item(*args.map(&:to_i))

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