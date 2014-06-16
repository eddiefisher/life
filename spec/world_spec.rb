require 'spec_helper'
require 'lib/engine'
require 'lib/world'

describe World do
  map = "*.**\n..*.\n*.**\n"

  world = World.new(map: map)

  it "initialize world" do
    expect(world.map).to eq("*.**\n..*.\n*.**\n")
  end

  it '.init_cells' do
    map = map.split("\n")
    world.rows = map.size
    world.cols = map[0].chomp.chars.to_a.size
    expect(world.init_cells).to eq(3)
  end

  it '.set_life_at(location)' do
    expect(world.set_life_at(row: 1, col: 1)).to eq('*')
  end
end