#!/usr/bin/env ruby

# Parses command line arguments
module CFG  
  @speed = 0.075
  @color_f = -1
  @color_b = -1
  @move = 35
  @time = false
  
  def CFG.speed
    @speed
  end
    def CFG.color_f
    @color_f
  end
    def CFG.color_b
    @color_b
  end
    def CFG.move
    @move
  end
    def CFG.time?
    @time
  end
  
  def CFG.parse argv
    #Default values
    #Commands
    @commands = ["--speed","-s","--color","-c","--move","-m","--time","-t","--help","-h"]
    #Parse
    (0..argv.size-1).step(2).each do |i|
      if !@commands.include? argv[i].downcase
        raise "Unknown command #{argv[i]}"
      end
      
      begin
        case argv[i].downcase
        when "--speed", "-s"
          if argv[i+1].match(/[^\d+\.\d+]/)
            raise "Incorrect argument '#{argv[i+1]}' for command '#{argv[i]}'"
          end
          @speed = argv[i+1].to_f
          
        when "--color", "-c"
          arg = argv[i+1].sub("white", "gray")
          puts arg
          if arg.include? "-"
            cf = arg.split("-")[0]
            cb = arg.split("-")[1]
          else
            cf = argv[i+1]
            cb = "black"
          end
          puts cf.c_index"rainbow"
          if (f = cf.c_index) == -1 or (b = cb.c_index) == -1
            raise "Incorrect argument '#{argv[i+1]}' for command '#{argv[i]}'"
          end
          @color_f = 30 + f
          @color_b = 40 + b
          
        when "--move", "-m"
          if argv[i+1].match(/[^\d+]/)
            raise "Incorrect argument '#{argv[i+1]}' for command '#{argv[i]}'"
          end
          @move = argv[i+1].to_i
          
        when "--move", "-m"
          if argv[i+1].match(/true|false/)
            raise "Incorrect argument '#{argv[i+1]}' for command '#{argv[i]}'"
          end
          @time = argv[i+1]
          
        when "--help", "-h"
          if i != 0
            raise "Command --help is solitary"
          end
          help = 
"""
  Fighters Help:

  Commands:
  --help  / -h  Show this help file
  --color / -c  Sets the text color. 
                Colors are #{"".colors}
                Can be stuck together using '-' e.g. red-green
                Warning: Bad for performance!
                Default: no colors
  --speed / -s  Sets the speed of the fighting
                Default: 0.075
  --move  / -m  Sets how far they will move right
                Default: 35
  --time  / -t  Should it show you a timer 'true/false'
                Default: false
"""
          puts help
          exit
        end
       
      rescue => msg
        puts msg
        exit
      end
      
    end
  end
end