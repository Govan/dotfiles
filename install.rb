#!/usr/bin/env ruby

require 'erb'

def install
  Dir['*'].each do |file|
    next if %w[install.rb README README.rdoc LICENSE].include? file
    link_or_replace_file file
  end
  install_submodules
  touch_zshrc_local
end

def link_or_replace_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    system %Q{ln -shFfv "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def install_submodules
  system "git submodule init"
  system "git submodule update"
end

def touch_zshrc_local
  target = File.expand_path("~/.zshrc_local")
  unless File.exists? target
    File.open(target, 'w') do |new_file|
      new_file << "# Put private customizations in here\n"
      new_file << "# and/or link to one of the per-machine shared configs\n"
    end
  end
end

install
