#!/usr/bin/env ruby
require_relative 'os'

# Clear console
module CL
  def CL.clear
    if OS.windows?
      system 'cls'
    elsif OS.unix?
      system 'clear'
    end
  end
end