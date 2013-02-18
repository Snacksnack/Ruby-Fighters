#!/usr/bin/env ruby

# Colors strings
class String #"\e[#{color_code}m#{self}\e[0m"
  @@colors = ["black","red","green","brown","blue","magenta","cyan","gray","rainbow"]
  def colorize f, b
    if f == -1 or b == -1
      self
    elsif f == 38 or b == 38
      colored = Array.new
      self.split("").each do |c|
        if f == 38 && c != " "
          cf = 30 + Random.rand(1..7)
        else
          cf = 0
        end
        if b == 38 && c != " "
          cb = 40 + Random.rand(1..7)
        else
          cb = 0
        end
        colored.push "\e[#{cf}m#{c}\e[#{cb}m"
      end
      colored.join
    else
      "\e[#{f}m#{self}\e[#{b}m"
    end
  end
  
  def c_index
    if @@colors.index(self).nil?
      -1
    else
      @@colors.index self
    end
  end
  
  def colors
    @@colors.join ", "
  end
end