#source ~/git-completion.bash
#source ~/.bash_prompt

EDITOR='nvim';
export EDITOR;
export HOME=/Users/daniwood

# custom ENV vars for mac
export RUST_SRC_PATH=/Users/daniwood/OSS/rust/bin/rust/src
export PATH=$PATH:/Users/daniwood/.cargo/bin


alias bake="bundle exec rake"
alias ..="cd ../$*"
alias boop="echo 'booped $*'"
#alias emacs="start emacs $*"
alias emac="emacs -nw $*"
alias merge="merge.sh $*"
alias lsh="ls -A"
alias lls="ls -lhA"
alias ffg="fg %1"
alias ffgg="fg %2"
alias ffggg="fg %3"
alias search="find . -name $*"
#alias rustdocs="cargo doc | /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --kiosk ./target/doc/*/index.html | cd ../../ && echo 'Generated documentation and started the doc-browser'"
alias folderwatch="python ~/OSS/scripts/folderwatch.py $*"
alias r="cd -"
alias vim="nvim $*"
alias vi="nvim $*"
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
#eval $(thefuck --alias)


code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

#daemon() {
#  chsum1=""
#
#  while [[ true ]]
#  do
#    chsum2=`find src/ -type f -mtime -5s`
#    if [[ $chsum1 != $chsum2 ]] ; then
#      $*
#      chsum1=$chsum2
#    fi
#    sleep 2
#    done
#}

#export NVM_DIR="/Users/daniwood/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias nr="npm run $*"
alias oss="cd ~/OSS"
alias commit="git commit -m $*"
alias checkout="git checkout $*"
alias pushup="git push -u origin $*"
alias push="git push $*"
alias forceup="git push -ff"
alias status="git status $*"
alias rebase="git rebase $*"
alias pull="git pull $*"
alias fetch="git fetch $*"
alias testaccount="cd ~/Workspace/OneExchangeTestAccountCreator"
alias remote="ssh root@173.214.169.122"
alias keyfaster="ssh root@keyfaster.com"
alias checkstring="oe && cat src/ExtendHealth.OneExchange/Web.config | grep 'connectionstring' -i"
alias stop="kill -9 $*"
alias add="git add -p"
export PATH=/Library/Frameworks/Python.framework/Versions/3.5/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/daniwood/.cargo/bin:/Users/daniwood/.config/scripts:/Users/daniwood/.config/scripts
alias imgcat="imgcat.sh $*"
alias mfa="cd ~/Workspace/mfa/mfa-sandbox"
alias eh="cd ~/Workspace/extend-health-website"
alias ls="ls -a $*"
