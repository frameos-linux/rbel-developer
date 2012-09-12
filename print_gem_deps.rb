#!/usr/bin/env ruby
require 'pp'

gemdeps = []
Dir['sources/*/*.spec'].each do |spec|
  File.read(spec).each_line do |l| 
    if l.match(/^\s*Requires:\s* rubygem\((.*?)\)/i)
      gemdeps << $1
    end
  end
end

gemdeps.sort.uniq.each { |g| puts g }
