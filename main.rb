#!/usr/bin/env ruby
require_relative 'clear'   #'CL'       clears console, requires 'os'
require_relative 'config'  #'CFG'      reads command line arguments
require_relative 'fighters'#'Fighters' the main drawing class

# Main
#if __FILE__ == $0
  CFG.parse ARGV
  fighters = Fighters.new
  move_flag = true
  move_count = 0
  if CFG.time?
    t_start = Time.now.to_i
  end
  while true
    sleep CFG.speed.to_f
    CL.clear! # Clears the console. Remove when not running this in one!
    fighters.draw
    fighters.parry
    if move_count > CFG.move.to_i
      move_count = 0
      move_flag = !move_flag
    end
    if move_flag
      fighters.move(1)
    else
      fighters.move(-1)
    end
    move_count += 1
    if CFG.time?
      puts "\nYou have been watching this nonsense for #{Time.now.to_i - t_start} second(s)"
    end
  end
#end