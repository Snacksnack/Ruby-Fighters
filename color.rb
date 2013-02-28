#!/usr/bin/env ruby
require_relative 'config' #'CFG'    reads command line arguments

# Colors strings
class String #"\e[#{color_code}m#{self}\e[0m"
  @@colors = ["none","black","red","green","brown","blue","magenta","cyan","gray"]
  def colorize f, b
    if f == -1 or b == -1
      self
    else
      "\e[#{f}m#{self}\e[#{b}m"
    end
  end
  
  def c_index
    if @@colors.index(self).nil?
      -2
    else
      @@colors.index(self) - 1
    end
  end
  
  def colors
    @@colors.join ", "
  end
end

# Override puts to add color codes
module Kernel
  def puts (s)
    $stdout.puts s.colorize(CFG.color_f, CFG.color_b)
  end
end