source ~/git-completion.bash
alias bake="bundle exec rake"
alias ..="cd ../$*"
alias boop="echo 'booped $*'"
#alias emacs="start emacs $*"
Starbounder(){
  "scp -r $1 root@keyfaster.com:/home/steam/starbound/giraffe_storage/mods"
}
alias addtostarbound=Starbounder
alias starboundserver="cd 'E:\\Games\\Steam LIbrary\\SteamApps\\common\\Starbound\\win64' && starbound_server"
alias emac="emacs -nw $*"
alias merge="merge.sh $*"
alias lsh="ls -A"
alias lls="ls -lhA"
alias ffg="fg %1"
alias ffgg="fg %2"
alias ffggg="fg %3"
alias search="find . -name $*"
alias rustdocs="cargo doc | /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --kiosk ./target/doc/*/index.html | cd ../../ && echo 'Generated documentation and started the doc-browser'"
alias folderwatch="python ~/OSS/scripts/folderwatch.py $*"
alias r="cd -"
alias vim="nvim $*"
alias vi="vim $*"
alias vimoe="cd ~/Workspace/one-exchange && vim $*"
alias vims="vim -S $*"
#alias vvimdiff="vimdiff `git diff --name-only`"

#Navigation
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias oe="cd ~/Workspace/one-exchange"
alias learnto="cd ~/OSS/learn-to-anything"
alias work="cd ~/daniwood/Workspace"
alias startmcserver="cd I:/Games/Minecraft\ 1.7.10/Forge\ Server && ./01StartServer.bat"
alias guess="cd ~/OSS/rust/projects/guessing_game"

#eval "$(thefuck --alias)"

find_and_open () {
  find . -name $1 | xargs vim
}
alias edit=find_and_open
EDITOR='vim';
export EDITOR;
#eval $(thefuck --alias)

# custom ENV vars for mac
export RUST_SRC_PATH=/Users/daniwood/OSS/rust/bin/rust/src

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

daemon() {
  chsum1=""

  while [[ true ]]
  do
    chsum2=`find src/ -type f -mtime -5s`
    if [[ $chsum1 != $chsum2 ]] ; then
      $*
      chsum1=$chsum2
    fi
    sleep 2
    done
}

export NVM_DIR="/Users/daniwood/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source ~/.bash_prompt
#eval "$(thefuck --alias)"
alias nr="npm run $*"
alias oss="cd ~/OSS"
