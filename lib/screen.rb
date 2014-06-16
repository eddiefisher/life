require 'curses'
include Curses

class Screen
	def initialize
    init_screen
    nl
    noecho
    srand
    start_color
    
    %w(HUP INT QUIT TERM).each do |i|
      trap(i) { |sig| onsig(sig) } if trap(i, "SIG_IGN") != 0
    end
  end
  
  def print(x, y, string, color)
    color = eval "COLOR_#{color.upcase}"
    init_pair(color, color, COLOR_BLACK)
    setpos(x, y)
    attron(color_pair(color)|A_NORMAL) {
      addstr(string)
    }
  end

  def reload
    refresh
  end

  private
  def onsig(sig)
    close_screen
    exit sig
  end
end
