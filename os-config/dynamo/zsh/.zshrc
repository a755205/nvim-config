
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias [General]
alias vim='nvim'
alias v='nvim'

alias lg='lazygit'
alias lp='lazynpm'
alias ld='lazydocker'
alias cat='bat'

# Alias [cd]
alias config='cd ~/.config'
alias repo='cd ~/repo'
alias myrepo='cd ~/my-repo'

# Alias [tree]
alias tree1='tree -L 1'
alias tree2='tree -L 2'
alias tree3='tree -L 3'

#Alias [Zsh]
alias mz='vim ~/.zshrc' # for modify zshrc
alias sz="source ~/.zshrc" # for source zshrc

# Alias [Exit]
alias wqa='exit'
alias wq='exit'

# Alias [Tmux]
alias tmux='tmux -f ~/.tmux.conf'
alias mt='vim ~/.tmux.conf' # for modify tmux config
alias st='tmux source-file $HOME/.tmux.conf'

# Alias [Sync OS config to nvim os files]
# [sync tmux]
alias sync-tmux='cp ~/.tmux.conf ~/.config/nvim/os-config/dynamo/tmux'
# [sync zsh]
alias sync-zsh='cp ~/.zshrc ~/.config/nvim/os-config/dynamo/zsh'
# [sync kitty]
alias sync-kitty='cp ~/.config/kitty/kitty.conf ~/.config/nvim/os-config/dynamo/kitty'
# [async (tmux, zsh, kitty)]
alias sync-os='sync-tmux && sync-zsh && sync-kitty'

# Alias [Docker]
alias dcul='docker compose up -d --watch'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dclf='docker compose logs -f'
alias dejilindb='docker exec -it jilin-api php artisan db'
alias dejilinsh='docker exec -it jilin-api /bin/bash' 
alias dexecapp='docker exec -it jilin-api php artisan ' 
alias dcp='# docker container ps'





# /Users/user/my-repo/jilin
# only allow in jilin folder
#
#
alias php='docker exec -it jilin-api php' # require docker container name is jilin-api
alias composer='docker exec -it jilin-api composer' # require docker container name is jilin-api


# Alias [ls]
alias ls='lsd'
alias l='ls -la'
alias ll='ls -la'
alias lt='ls --tree'

#Alias [Vim]
alias mn='vim ~/.config/nvim' # for modify nvim config
alias chear-vim-cache="rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim && rm -rf ~/.local/state/nvim"

#Alias [Change Git]
alias git='LANG=en_US git' # set get language as english

# Alias for glow markdown reader
alias md='glow'

#add alias for zsh_extend sh file 
for zsh_extends in ~/.zsh_clilike_extend//*; do
  zsh_extends_name=$(basename $zsh_extends)
  alias ${zsh_extends_name%.*}="sh $zsh_extends"
done

# Alias for vue test [vitest]
alias vitest='npx vitest'

# Alias from [Vue] Project
alias vuerunstage='npm run build:stag && npm run stag -- --port=8888'



# Active SSH Agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
fi

export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# # in start up, run add ssh key with password
# # set password is 'qwer123'
DEV_SSH_PASS='qwer123'
# # 加入ssh key的脚本
# ADD_SCRIPT='ssh-add $HOME/.ssh/kent-dynamo-mbp'
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    expect -c "
    spawn $ADD_SCRIPT
    expect \"Enter passphrase for /Users/kent/.ssh/kent-dynamo-mbp:\"
    send \"$DEV_SSH_PASS\n\"
    interact
    "
fi

# cli
# add execute permission first cmd as ,
# chmod +x /Users/user/repo/fantasi-agency-operations-system/cli/fantasi-agency-build.js
# export PATH=$PATH:/Users/user/repo/fantasi-agency-operations-system/cli/fantasi-agency-build.js

export PATH="$PATH:/Users/user/repo/fantasi-agency-operations-system/cli"

# 變更編碼
export LC_ALL="en_US.UTF-8"

# fzf 
eval "$(fzf --zsh)" # Set up fzf key bindings and fuzzy completion
alias fzf="fzf --preview 'bat --color=always --style=header,grid --line-range :500 {}'" # fzf preview with bat
alias vf="nvim \$(fzf --height 100% --preview 'bat --color=always --style=header,grid --line-range :500 {}' --preview-window=right:60%:wrap)" # fzf preview with bat and open with nvim

## Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

