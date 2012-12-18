# vim FTW
Pry.config.editor = "vim --nofork"

# My pry is polite
Pry.hooks = { :after_session => proc { puts "bye-bye" } }

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]
