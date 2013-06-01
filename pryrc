Pry.config.editor = "vim --nofork"

# github.com/michaeldv/awesome_print/
# $ gem install awesome_print
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai(:indent => 2) }
rescue LoadError => e
  warn "[WARN] #{e}"
  puts "$ gem install awesome_print"
end
