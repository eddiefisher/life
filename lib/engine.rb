class Engine
  def initialize(world, screen)
    @world = world
    @screen = screen
    generate(@world.map)
  end

  def generate(map)
    map = map.split("\n")
    @world.rows = map.size
    @world.cols = map[0].chomp.chars.to_a.size
    @world.init_cells

    cur_row = 0
    map.each do |row|
      cur_col = 0
      row.chars.each do |cell|
        @world.set_life_at(row: cur_row, col: cur_col) if cell == @world.live_cell
        cur_col += 1
      end
      cur_row += 1
    end
  end

  def next_generation
    new_cells = []
    cur_row = 0
    @world.cells.each do |row|
      cur_col = 0
      new_row = []
      row.each do |cell|
        new_cell = Inhabitant.new(@world, cur_row, cur_col).status(cell)
        new_row << new_cell
        cur_col += 1
      end
      new_cells << new_row
      cur_row += 1
    end
    @world.cells = new_cells
  end

  def draw
    ret = ''
    @world.cells.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        string = (cell == @world.live_cell ? @world.live_cell : @world.empty_cell)
        @screen.print(x, y, string, 'green')
      end
    end
    @screen.reload
  end
end
