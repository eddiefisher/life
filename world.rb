class World
  attr_accessor :rows, :cols, :cells, :empty_cell, :live_cell

  def initialize(attrs = {})
    self.empty_cell = attrs[:empty_cell] || '.'
    self.live_cell = attrs[:live_cell] || '*'
    self.cells = []
    self.rows = 20
    self.cols = 40

    if attrs[:map]
      generate(attrs[:map])
    else
      self.cols = attrs[:cols] || cols
      self.rows = attrs[:rows] || rows
      init_cells
    end
  end

  def init_cells
    rows.times do
      row = []
      cols.times { row << empty_cell }
      cells << row
    end
  end

  def draw
    ret = ''
    $stdout.flush
    cells.each do |row|
      $stdout.write row.each { |cell| ret << (cell == live_cell ? live_cell : empty_cell) }.join('') + "\n"
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

  def set_life_at(location)
    cells[location[:row]][location[:col]] = live_cell
  end
end
