class Screen
	def initialize
    init_screen
    nl
    noecho
    srand
    
    for i in %w[HUP INT QUIT TERM]
      if trap(i, "SIG_IGN") != 0 then
        trap(i) { |sig| onsig(sig) }
      end
    end
  end
  
  def print(x, y, string)
    setpos(x, y)
    addstr(string)
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