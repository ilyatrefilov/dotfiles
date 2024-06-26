set -gx EDITOR nvim
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH /home/ilya/go/bin
set -gx PATH $PATH /home/ilya/.local/bin
set -gx PATH $PATH /home/ilya/.cargo/bin
set -gx PATH $PATH /home/ilya/.yarn/bin
set -gx PATH $PATH /home/ilya/.porter

alias vim nvim
alias k kubectl
alias ls exa
alias gw 'git worktree'
alias gwl 'git worktree list'
alias gwa 'git worktree add'
alias gwr 'git worktree remove'
alias gc 'git commit -S'
alias gco 'git checkout'
alias gs 'git status'
alias ga 'git add'
alias gl 'git log'
alias hx helix
alias wtic 'wezterm imgcat'

bind \cs tmux-sessionizer

set -U fish_greeting ""
starship init fish | source
zoxide init fish | source




# # TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467c
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
#


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /home/ilya/.ghcup/bin # ghcup-env

# opam configuration
source /home/ilya/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
