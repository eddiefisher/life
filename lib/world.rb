class World
  attr_accessor :rows, :cols, :cells, :empty_cell, :live_cell, :map

  def initialize(map, empty_cell = ' ', live_cell = '*')
    @empty_cell = empty_cell
    @live_cell = live_cell
    @cells = []
    @map = map
  end

  def init_cells
    rows.times do
      row = []
      cols.times { row << empty_cell }
      cells << row
    end
  end

  def set_life_at(location)
    cells[location[:row]][location[:col]] = live_cell
  end
end
