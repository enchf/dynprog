# frozen_string_literal: true

require 'curses'

module DP
  class Display
    def initialize(height, width)
      Curses.init_screen

      @height = height
      @width = width

      @window = Curses::Window.new(height, width, 0, 0)
      @window.box('|', '-')
      
      reset_position
    end

    def reset_position
      position 2, 2
    end

    def position(x, y)
      @window.setpos(x, y)
    end

    def append(data)
      data = data.is_a?(Array) ? data : [data]
      data.each { |line| @window << line }
      @window.refresh
    end

    def prompt
      @window.getch
    end

    def close
      position(0, 0)
      blank = (' ' * @width) + "\n"
      (0...@height).each { @window << blank }
      @window.refresh
      @window.close
    end
  end
end
