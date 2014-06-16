class World
  attr_accessor :rows, :cols, :cells, :empty_cell, :live_cell, :map

  def initialize(attrs = {})
    self.empty_cell = attrs[:empty_cell] || ' '
    self.live_cell = attrs[:live_cell] || '*'
    self.cells = []
    self.map = attrs[:map]
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
