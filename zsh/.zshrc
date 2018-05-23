# Path to your oh-my-zsh installation.
export ZSH=/Users/martinellid/.oh-my-zsh

# Set name of the theme to load.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR="vim"

# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

export PATH=/usr/local/Cellar/vim/8.1.0001/bin:$PATH
export PATH=$HOME/bin:$PATH

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# FZF settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'head -100 {}'"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

function hex() {
  echo -n $1 | od -A n -t x1 | tr -d '[:space:]' | sed 's/^/0x/'
}

alias c="clear"
alias tmus="tmux"  # I keep doing this typo, so I embrace it
alias ta="tmux attach -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tks="tmux kill-session -t"
