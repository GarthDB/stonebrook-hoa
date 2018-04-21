# == Dependencies ==============================================================

require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'
require 'html-proofer'
require 'scss_lint/rake_task'

# == Configuration =============================================================


# Get and parse the date
DATE = Time.now.strftime("%Y-%m-%d")

# Directories
POSTS = "blog/_posts/"
DRAFTS = "_drafts"
BLOG = "blog/"

# == Helpers ===================================================================

# Execute a system command
def execute(command)
  system "#{command}"
end

# == Tasks =====================================================================

desc "watch and build files"
task :watch do
  sh "bundle exec jekyll build --watch --incremental --config _config_dev.yml"
end

desc "serve and reload website"
task :reload do
  sh "browser-sync start --server '_site' --files '_site'"
end

multitask 'build_parallel' => ['watch', 'reload']

task :default do
  sh "bundle exec jekyll build"
  Rake::Task['build_parallel'].invoke
end

SCSSLint::RakeTask.new do |task|
end

# rake test
desc "build and test website"
task :test do
  if !File.exists? "./_site"
    sh "bundle exec jekyll build"
  end
  HTMLProofer.check_directory("./_site", {
    :url_ignore => [],
    :cache => {
      :timeframe => '1d'
    },
    :typhoeus => {
      :followlocation => true,
      :ssl_verifypeer => false,
      :headers => { 'User-Agent' => 'html-proofer' }
    }
  }).run
end
