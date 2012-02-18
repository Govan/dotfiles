source ~/.bash/path
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/rvmrc
source ~/.bash/config

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
