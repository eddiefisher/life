class World
  attr_accessor :rows, :cols, :cells, :empty_cell, :live_cell

  def initialize(attrs = {})
    self.empty_cell = attrs[:empty_cell] || '.'
    self.live_cell = attrs[:live_cell] || '*'
    self.cells = []

    generate(attrs[:map])
  end

  def draw
    ret = ''
    cells.each do |row|
      row.each { |cell| ret << (cell == live_cell ? live_cell : empty_cell) }
    end
  end

  def generate(map)
    map = map.split("\n")
    self.rows = map.size
    self.cols = map[0].chomp.chars.to_a.size
    init_cells

    cur_row = 0
    map.each do |row|
      cur_col = 0
      row.chars.each do |cell|
        set_life_at(row: cur_row, col: cur_col) if cell == live_cell
        cur_col += 1
      end
      cur_row += 1
    end
  end

  private

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
