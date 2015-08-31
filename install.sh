
create_zshrc_local() {
  local zshrc_local="$HOME/.zshrc_local";
  if [ ! -f $zshrc_local ]
  then
    touch $zshrc_local;
    echo "Creating placeholder at ${zshrc_local}"
    echo "# Put private customizations in here" >> $zshrc_local
    echo "# and/or link to one of the per-machine shared configs" >> $zshrc_local
  fi

}

link_dotfile() {
  local source=$1
  local filename=$(basename "$source");
  if [ $filename == "install.sh" -o $filename == "README.md" ] 
  then
    echo "skipping $filename"
  else
    if [ $filename == "Vagrantfile" ]
    then
      ln -nsFfv "$source" "$HOME/.vagrant.d/${filename}"
    else
      ln -nsFfv "$source" "$HOME/.${filename}"
    fi
  fi
}

link_vagrantfile() {
  ln -nsFfv "$source" "$HOME/.${filename}"
}

link_dotfiles() {
  local source_directory=$(dirname "$(cd "$(dirname "$0")" && pwd)/$(basename "$0")")
  for file in $source_directory/*
  do 
    link_dotfile $file
  done
}

install_git_submodules() {
  git submodule init
  git submodule update
}


main() {
  install_git_submodules
  create_zshrc_local
  link_dotfiles
} 

main
