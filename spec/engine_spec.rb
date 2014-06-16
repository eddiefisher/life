require 'spec_helper'
require 'lib/engine'
require 'lib/inhabitant'
require 'lib/screen'
require 'lib/world'

describe Engine do
  map = "*.**.\n..*..\n*.**.\n"

  world = World.new(map)
  screen = Screen.new
  engine = Engine.new(world, screen)

  it ".generate(map)" do
    expect(engine.generate(world.map)).to eq(["*.**.", "..*..", "*.**."])
  end

  it ".next_generation" do
    expect(engine.next_generation).to eq([
      [" ", "*", "*", "*", " "],
      [" ", " ", " ", " ", " "],
      [" ", "*", "*", "*", " "],
      [" ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " "]
    ])
  end
end
