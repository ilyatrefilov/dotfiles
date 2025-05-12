set -gx EDITOR nvim
set -gx PATH $PATH /home/ilya/go/bin/
set -gx PATH $PATH /home/ilya/.local/bin/
set -gx PATH $PATH /home/ilya/.cargo/bin/
set -gx PATH $PATH /home/ilya/.yarn/bin/
set -gx PATH $PATH /home/ilya/.porter/bin/
set -gx PATH $PATH /home/ilya/.local/zig/
set -gx CC /usr/bin/clang

alias vim nvim
alias k kubectl
alias ls exa
alias cp 'uu-cp'
abbr gw 'git worktree'
abbr gwl 'git worktree list'
abbr gwa 'git worktree add'
abbr gwr 'git worktree remove'
abbr gc 'git commit -S'
abbr gco 'git checkout'
abbr gs 'git status'
abbr ga 'git add'
abbr gl 'git log'



bind \cs tmux-sessionizer

set -U fish_greeting ""
starship init fish | source
zoxide init fish | source


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/ilya/.opam/opam-init/init.fish' && source '/home/ilya/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
