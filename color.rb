#!/usr/bin/env ruby

# Colors strings
class String #"\e[#{color_code}m#{self}\e[0m"
  @colors = ["black","red","green","brown","blue","magenta","cyan","gray","rainbow"]
  def colorize f, b
    if f == -1 or b == -1
      self
    elsif f == 8 or b == 8
      colored = Array.new
      self.each do |c|
        if f == 8
          cf = Random.rand 0..7
        else
          cf = 0
        end
        if f == 8
          cb = Random.rand 0..7
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
    if @colors.index(self).nil?
      -1
    else
      @colors.index self
    end
  end
  
  def colors
    @colors.join ", "
  end
end