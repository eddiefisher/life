class Engine
  attr_accessor :world

  def initialize(world)
    self.world = world
  end

  def next_generation
    new_cells = []
    cur_row = 0
    world.cells.each do |row|
      cur_col = 0
      new_row = []
      row.each do |cell|
        new_cell = Inhabitant.new(
            world: world,
            row: cur_row,
            col: cur_col
          ).status(cell)
        new_row << new_cell
        cur_col += 1
      end
      new_cells << new_row
      cur_row += 1
    end
    world.cells = new_cells
  end
end
