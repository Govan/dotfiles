Vagrant.configure(2) do |config|
  # Configure vagrant-cachier
  # https://github.com/fgrehm/vagrant-cachier
  puts "Using vagrant-cachier in ~/vagrant.d/Vagrantfile"
  config.cache.scope = :box
  # config.cache.auto_detect = false
  # Cache Chef
  # https://github.com/chef/vagrant-omnibus
  puts "Using vagrant-omnibus in ~/vagrant.d/Vagrantfile"
  config.omnibus.chef_version = :latest
  config.omnibus.cache_packages = true
end
