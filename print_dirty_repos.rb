require 'grit'
require 'colored'

base_dir = Dir.pwd
Dir.chdir 'sources'

Dir["*/*.spec"].each do |d|
  repo = File.dirname(d)
  r = Grit::Repo.new(repo)
  status = r.status
  unless status.changed.empty? and \
         status.added.empty? and \
         status.deleted.empty? and \
         status.untracked.empty?
    puts "Repo #{repo} dirty".red.bold
    old_dir = Dir.pwd
    Dir.chdir repo
    `git status`.each_line { |l| puts "  #{l}" }
    Dir.chdir old_dir
  end
end

Dir.chdir base_dir
