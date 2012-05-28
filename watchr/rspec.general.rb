def growl(message)
  growlnotify = `which growlnotify`.chomp
  title = "Fail!"
  image = "~/.watchr/images/owls/failed.png"
  if message.include? "0 failures" 
    title = "Pass!"
    image = "~/.watchr/images/owls/passed.png"
  end
  options = "-w -n Watchr --image '#{File.expand_path(image)}' -m '#{message}' '#{title}'"
  system %(#{growlnotify} #{options} &)
end

def run(cmd)
  puts(cmd)
  `#{cmd}`
end

def run_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  result = run "bundle exec rspec #{file}"
  growl result.split("\n").last rescue nil
  puts result
end

watch("spec/.*/*_spec.rb") do |match|
  run_spec match[0]
end

watch("app/(.*/.*).rb") do |match|
  run_spec %{spec/#{match[1]}_spec.rb}
end

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }
