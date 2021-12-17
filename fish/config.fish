starship init fish | source
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH /home/ilya/.cargo/bin
set -gx GOPATH /home/ilya/go
set -gx PATH $PATH $GOPATH/bin
nvm use v16.13.1
set -gx EDITOR nvim
alias vim nvim
