require 'rake'
require 'bundler/gem_tasks'

desc 'Default: Run all specs.'
task :default => 'all:spec'


namespace :travis do

  desc 'Run tests on Travis CI'
  task :run => ['slimgems', 'all:bundle:install', 'all:spec']

  desc 'Install slimgems'
  task :slimgems do
    if RUBY_VERSION == '1.8.7'
      system('gem install slimgems')
    end
  end

end

namespace :all do

  desc "Run specs on all spec apps"
  task :spec do
    success = true
    for_each_directory_of('spec/**/Rakefile') do |directory|
      env = "SPEC=../../#{ENV['SPEC']} " if ENV['SPEC']
      success &= system("cd #{directory} && #{env} bundle exec rake spec")
    end
    fail "Tests failed" unless success
  end

  namespace :bundle do

    desc "Bundle all spec apps"
    task :install do
      for_each_directory_of('spec/**/Gemfile') do |directory|
        Bundler.with_clean_env do
          system("cd #{directory} && bundle install")
        end
      end
    end

    desc "Update all gems, or a list of gem given by the GEM environment variable"
    task :update do
      for_each_directory_of('spec/**/Gemfile') do |directory|
        Bundler.with_clean_env do
          system("cd #{directory} && bundle update #{ENV['GEM']}")
        end
      end
    end

  end

end

def for_each_directory_of(path, &block)
  Dir[path].sort.each do |rakefile|
    directory = File.dirname(rakefile)
    puts '', "\033[44m#{directory}\033[0m", ''

    if (RUBY_VERSION == '1.8.7' && directory =~ /-4\.2$/) ||
      (RUBY_VERSION != '1.8.7' && directory =~ /-2\.3$/)
      puts "Skipping tests for Ruby #{RUBY_VERSION} since it is unsupported"
    else
      block.call(directory)
    end
  end
end
