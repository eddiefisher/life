require 'spec_helper'
require 'lib/inhabitant'
require 'lib/screen'
require 'lib/world'
require 'lib/engine'

describe Inhabitant do
  map = "*.**\n..*.\n*.**\n"

  world = World.new(map: map)
  screen = Screen.new
  engine = Engine.new(world, screen)
  inhabitant = Inhabitant.new(
    world: world,
    row: 2,
    col: 2
  )

  it '.neighbour_count' do
    expect(inhabitant.neighbour_count).to eq(2)
  end

  it '.lived?(location)' do
    expect(inhabitant.lived?(row: 1, col: 1)).to eq(false)
  end

  it '.status(cell)' do
    cell = [2][2] = world.live_cell
    expect(inhabitant.status(cell)).to eq('*')
  end

  it '.can_die?(cell, neighbours) = true' do
    cell = [2][2] = world.live_cell
    neighbours = inhabitant.neighbour_count
    expect(inhabitant.can_die?(cell, neighbours)).to eq(true)
  end

  it '.can_die?(cell, neighbours) not many neighbours' do
    cell = [2][2] = world.live_cell
    neighbours = inhabitant.neighbour_count - 1
    expect(inhabitant.can_die?(cell, neighbours)).to eq(false)
  end

  it '.can_die?(cell, neighbours) many neighbours' do
    cell = [2][2] = world.live_cell
    neighbours = inhabitant.neighbour_count + 2
    expect(inhabitant.can_die?(cell, neighbours)).to eq(false)
  end
end