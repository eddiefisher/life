require 'curses'
include Curses

class Screen
	def initialize
    init_screen
    nl
    noecho
    srand
    start_color
    
    for i in %w[HUP INT QUIT TERM]
      if trap(i, "SIG_IGN") != 0 then
        trap(i) { |sig| onsig(sig) }
      end
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