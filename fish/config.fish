set -gx EDITOR nvim
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH /home/ilya/go/bin
set -gx PATH $PATH /home/ilya/.local/bin
alias vim nvim
alias k kubectl
alias ls exa

bind \cs tmux-sessionizer

starship init fish | source
