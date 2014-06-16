#!/usr/local/bin/ruby

require 'rubygems'
require 'bundler/setup'
require './inhabitant'
require './world'
require './life'
require 'curses'
include Curses

map = \
  "**.........................**\n" +
  ".*.........................*.\n" +
  ".*.*.......*.............*.*.\n" +
  "..**.....*..*.....*......**..\n" +
  "............*.....**.........\n" +
  "........*..........**........\n" +
  "........*...**....**.........\n" +
  ".........*****...............\n" +
  ".............................\n" +
  ".........*****...............\n" +
  "........*...**....**.........\n" +
  "........*..........**........\n" +
  "............*.....**.........\n" +
  "..**.....*..*.....*......**..\n" +
  ".*.*.......*.............*.*.\n" +
  ".*.........................*.\n" +
  "**.........................**\n"

def onsig(sig)
  close_screen
  exit sig
end

for i in %w[HUP INT QUIT TERM]
  if trap(i, "SIG_IGN") != 0 then
    trap(i) { |sig| onsig(sig) }
  end
end

world = World.new(map: map)
life = Life.new(world)

init_screen
nl
noecho
srand

world.draw.each_with_index do |line, i|
  setpos(i, 1)
  addstr(line.join(''))
end

while true
  life.next_day
  world.draw.each_with_index do |line, i|
    setpos(i, 1)
    addstr(line.join(''))
  end
  refresh
  sleep 0.1
end
