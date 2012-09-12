#!/usr/bin/env ruby
require 'colored'

if File.directory?('sources')
  $stderr.puts "sources directory already exists. Aborting."
  exit 1
end

Dir.mkdir 'sources'

gems = %w{
  chef
  chef-server
  chef-server-api
  chef-server-webui
  chef-expander
  chef-solr  
}

gems.each do |gem| 
  repo_url = "git@github.com:frameos/rubygem-#{gem}-rpm.git"
  puts "Cloning #{repo_url}..."
  out = `git clone #{repo_url} sources/rubygem-#{gem}-rpm 2>&1`
  if $? != 0
    $stderr.puts "Cloning #{repo_url} failed.".red
    $stderr.puts out.red
  end
end

puts "Cloning required deps..."
`ruby print_gem_deps.rb`.each_line do |l|
  gem = l.strip.chomp
  repo_url = "git@github.com:frameos/rubygem-#{gem}-rpm.git"
  puts "Cloning #{repo_url}..."
  out = `git clone #{repo_url} sources/rubygem-#{gem}-rpm 2>&1`
  if $? != 0
    $stderr.puts "Cloning #{repo_url} failed.".red
    $stderr.puts out.red
  end
end
