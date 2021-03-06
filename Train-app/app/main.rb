require_relative '../modules/instance_counter'
require_relative '../modules/validation'
require_relative '../modules/accessor'
require_relative '../creator'
require_relative '../railway_station'
require_relative '../route'

require_relative '../carriages/carriage'
require_relative '../carriages/cargo_carriage'
require_relative '../carriages/passenger_carriage'

require_relative '../trains/train'
require_relative '../trains/cargo_train'
require_relative '../trains/passenger_train'

class Main
  def initialize(data = {})
    @data = data
    start
  end

  def start
    menu.start
  end

  protected

  def menu
    Menu.new
  end

  def switch(action)
    action
  end

  def exit_loop(text, actions_list, &block)
    catch(:exit) do
      loop do
        system('clear')
        puts text
        actions_list.each { |action| puts action }
        command = user_input
        throw :exit if command == 'b'
        block.call(command)
      end
    end
  end

  def wrong
    system('clear')
    puts 'Invalid command, press any key for continue'
    user_input
  end

  def no_match(value)
    puts "First create a #{value}"
    user_input
  end

  def exit
    puts 'Enter any for continue'
    user_input
  end

  def user_input
    gets.chomp
  end
end

require_relative './menu'
require_relative './create/create_menu'
require_relative './create/create_train'
require_relative './create/create_car'
require_relative './create/create_station'
require_relative './create/create_route'

require_relative './actions/trains_actions'
require_relative './actions/routes_actions'
require_relative './actions/cars_actions'

Main.new
