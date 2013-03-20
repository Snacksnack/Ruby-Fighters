#!/usr/bin/env ruby
require 'rbconfig'

# Detects OS
module OS
  def OS.windows?
    (RbConfig::CONFIG['host_os'] =~ /cygwin|mswin|mingw|bccwin|wince|emx/) != nil
  end

  def OS.mac?
    (RbConfig::CONFIG['host_os'] =~ /darwin/) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end
end