export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

function smart_git_push() {
  git push --set-upstream origin `git symbolic-ref --short HEAD`
}

alias .zshrc="subl ~/.zshrc"
alias .gitconfig="subl ~/.gitconfig"
# See . files using ls
alias ls="ls -ah"

## RAILS SPECIFIC
alias devlog="tail -f -n 200 log/development.log"
alias testlog="tail -f -n 200 log/test.log"
alias be="bundle exec"
alias ber="bundle exec rspec"
alias bo="EDITOR=subl bundle open"
alias bu="bundle update"

alias rebuild="be rake db:drop db:create db:migrate && be rake db:seed db:test:prepare"
alias restore="rails db:drop db:create && rails db:migrate && rails db:seed && rails db:migrate RAILS_ENV=test"

## GIT
alias gbr="git branch"
alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gpu="smart_git_push" # git push upstream
alias gst="git status"
