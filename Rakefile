require 'rake'

desc "install my vim setup"
task :install do
  setup_submodules
  setup_command_t  
  replace_file("vimrc")
  replace_file("gvimrc")
  replace_file("vim")
  create_swap_directory
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def create_swap_directory 
  system %Q{mkdir "$HOME/.vimswap"}
end

def setup_submodules
  system "git submodule init"
  system "git submodule update"
end

def setup_command_t
  system "cd vim/bundle/command-t && rake make"
end


def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
