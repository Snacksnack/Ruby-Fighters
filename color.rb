#!/usr/bin/env ruby

# Colors strings
class String #"\e[#{color_code}m#{self}\e[0m"
  @@Colors = ["black","red","green","brown","blue","magenta","cyan","gray"]
  def colorize f, b
    if f == -1 or b == -1
      self
    else
      "\e[#{f}m#{self}\e[#{b}m"
    end
  end
  
  def c_index
    if @@Colors.index(self).nil?
      -1
    else
      @@Colors.index self
    end
  end
  
  def colors
    @@Colors.join ", "
  end
end