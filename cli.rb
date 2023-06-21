#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"

class CLI
  ROOT_DIR = __dir__
  AUTOLOAD_DIR = File.join(ROOT_DIR, "autoload")
  COLORS_DIR = File.join(ROOT_DIR, "colors")
  LUA_DIR = File.join(ROOT_DIR, "lua")
  EXTRAS_DIR = File.join(ROOT_DIR, "extras")
  REPOS_DIR = File.join(ROOT_DIR, "repos")

  def initialize(options)
    puts "CLI Running: #{options.inspect}"
    @cmd = options[0] || "pull"
    @repos = read_repos
    setup
  end

  def run
    case cmd
    when "pull"
      pull
    when "sync"
      sync
    when "clean"
      clean
    end
  end

  def self.run(options)
    new(options).run
  end

  private

  attr_reader :cmd, :repos

  def read_repos
    File.readlines(File.join(ROOT_DIR, "repos.txt")).map(&:chomp).each_with_object({}) do |repo, result|
      name = File.basename(repo, ".git")
      result[name] = repo
    end
  end

  def setup
    FileUtils.mkdir_p(REPOS_DIR)
    FileUtils.mkdir_p(AUTOLOAD_DIR)
    FileUtils.mkdir_p(COLORS_DIR)
    FileUtils.mkdir_p(EXTRAS_DIR)
    FileUtils.mkdir_p(LUA_DIR)
  end

  def clean
    FileUtils.rm_rf(AUTOLOAD_DIR)
    FileUtils.rm_rf(COLORS_DIR)
    FileUtils.rm_rf(EXTRAS_DIR)
    FileUtils.rm_rf(LUA_DIR)
  end

  def sync
    FileUtils.chdir(REPOS_DIR) do
      repos.each do |name, repo|
        puts "==> #{repo}"

        FileUtils.chdir(name) do
          if name == "base16-vim"
            exec "cp colors/base16-grayscale-*.vim #{COLORS_DIR}/" if File.directory?("colors")
            next
          end

          if File.directory?("lua")
            # Skip lua themes for now
            next
          end
          exec "cp -r autoload/* #{AUTOLOAD_DIR}/" if File.directory?("autoload")
          exec "cp colors/*.vim #{COLORS_DIR}/" if File.directory?("colors")
          exec "cp -r extras/* #{EXTRAS_DIR}/" if File.directory?("extras")
        end
      end
    end
  end

  def pull
    FileUtils.chdir(REPOS_DIR) do
      repos.each do |name, repo|
        puts "==> #{repo}"

        if File.directory?(name)
          FileUtils.chdir(name) { exec "git pull" }
        else
          exec "git clone #{repo}"
        end
      end
    end
  end

  def exec(command)
    puts "--> #{command}"
    `#{command}`
  end
end

if __FILE__ == $0
  CLI.run(ARGV)
end
