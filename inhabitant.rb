class Inhabitant
  attr_accessor :row, :col, :cells, :world

  def initialize(attrs = {})
    self.world = attrs[:world]
    self.row = attrs[:row]
    self.col = attrs[:col]
  end

  def can_die?(cell, neighbours)
    return true if cell == world.empty_cell && neighbours == 3
    return true if cell == world.live_cell && (neighbours == 3 || neighbours == 2)
    false
  end

  def status(cell)
    can_die?(cell, neighbour_count) ? world.live_cell : world.empty_cell
  end

  def neighbour_count
    neighbour_vectors = []
    delta_row = [-1, 0, 1]
    delta_col = [-1, 0, 1]
    delta_row.each do |d_r|
      delta_col.each do |d_c|
        next if d_r == 0 && d_c == 0
        neighbour_vectors << [d_r, d_c]
      end
    end

    count = 0
    neighbour_vectors.each do |v|
      at_location = {}
      at_location[:row] = row + v[0]
      at_location[:col] = col + v[1]
      count += 1 if lived?(at_location)
    end

    count
  end

  def lived?(location)
    return false if location[:row] < 0
    return false if location[:col] < 0
    return false if location[:col] > world.cols - 1
    return false if location[:row] > world.rows - 1
    return world.cells[location[:row]][location[:col]] == world.live_cell rescue false
  end
end
