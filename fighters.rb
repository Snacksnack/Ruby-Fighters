#!/usr/bin/env ruby

# Let's fight! And insult like men!
class Fighters
  # Set everything up
	def initialize
		@text = # @ marks arms on next char, $ marks legs on next char
"""
  ~O    O~
  <|\\@_@\\/|>
   |    |
  $/ $|  $/ $|
"""
		@insults = [ "You smell of elderberries!",
		             "I've fought mudcrabs fiercer than you!",
			           "Prepare to die, knave!",
			           "My swords shills are highly ventilated!",
			           "Dance I say, dance!",
			           "Engarde!",
			           "I will defeat you! Believe it!",
			           "Your fly is undone!",
			           "Die you dubius donut!",
			           "You are an unsightly strumpet!",
			           "You can not best me!",
			           "You've met your match!" ]
	  @cur_insult = @insults[Random.rand @insults.size]
		@insult_count = 0
		@text_spacer = ""
		@insulter = true
	end
	
	# Move the players (and insults)
	def move increment
		new_text = Array.new
		if increment > 0
			@text_spacer += " " * increment
		else
			@text_spacer = @text_spacer[1..increment]
		end
		@text.split("\n").each do |line|
      if increment > 0 
        line = (" " * increment) + line
			elsif increment < 0 
			  line = line[increment.abs..line.size]
			end
			new_text << line
	  end
		@text = new_text.join "\n"
	end	
	
	# Let the players fight
	def parry
	  new_text = @text.split("").to_a
	  
	  # Find their arm markers
		marker1 = @text.index("@")
		marker2 = @text[marker1 + 1..@text.size].index("@") + @text[1..marker1 + 1].size
		# 'Move' their arms
		new_text[marker1 + 1] = change ["/","|","_"],  @text[marker1 + 1]
		new_text[marker2 + 1] = change ["\\","|","_"], @text[marker2 + 1]
  
    # Find their leg markers
		marker1 = @text.index("$")
		marker2 = @text[marker1 + 1..@text.size].index("$") + @text[1..marker1 + 1].size
		marker3 = @text[marker2 + 1..@text.size].index("$") + @text[1..marker2 + 1].size
    marker4 = @text[marker3 + 1..@text.size].index("$") + @text[1..marker3 + 1].size
    # 'Move' their legs
    new_text[marker1 + 1] = change ["/","|"],  @text[marker1 + 1]
    new_text[marker2 + 1] = change ["\\","|"], @text[marker2 + 1]
    new_text[marker3 + 1] = change ["/","|"],  @text[marker3 + 1]
    new_text[marker4 + 1] = change ["\\","|"], @text[marker4 + 1]
    
		@text = new_text.join
	end
	
	# Return the next move to show
	def change chars, value
    if chars.index(value) == chars.size - 1
      chars[0]
    else
      chars[chars.index(value) + 1]
    end
	end
	
	# Draw the players
	def draw
    # Determine the insult and place it
		if @insult_count > 15
		  insult = @cur_insult
		  # Prevent the same insult
		  while @cur_insult.eql? insult
		    insult = @insults[Random.rand @insults.size]
			end
			@cur_insult = insult
			@insulter = !@insulter
			@insult_count = 0
	  end
		@insult_count += 1
		puts @text_spacer + @cur_insult
		if @insulter == true
			puts @text_spacer + "    /"
		else
			puts @text_spacer + "       \\"
		end
		# Draw the rest
		draw_text = @text.split("").to_a
	  draw_text.delete "@"
	  draw_text.delete "$"
		draw_text.join.split("\n").each do |line|
			puts line
		end
	end
end