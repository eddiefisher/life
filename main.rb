#!/usr/local/bin/ruby

require 'rubygems'
require 'bundler/setup'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

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

world = World.new(map: map)
screen = Screen.new
engine = Engine.new(world, screen)

engine.draw

while true
  engine.next_generation
  engine.draw
  sleep 0.1
end
