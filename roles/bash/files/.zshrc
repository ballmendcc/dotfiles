# Automatically start and attach to a tmux session named 'default'
# if [ -z "$TMUX" ]; then
#     tmux attach-session -t default || tmux new-session -s default
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to your standard editor.
export EDITOR=nvim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# ass ssh keys to ssh agent plugin
zstyle :omz:plugins:ssh-agent identities id_ed25519


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  ssh-agent
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-autosuggestions
  # zsh-navigation-tools
  asdf
  fzf-zsh-plugin
  # zsh-bat
)

source $ZSH/oh-my-zsh.sh

for file in $HOME/.config/zsh/*.sh; do
  source "$file"
done

# User configuration

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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

# function cc() {
#   local dirs
#   pushd ~/code/cleanercode >/dev/null  # Change to ~/code/cleanercode directory and hide output
#   dirs=(*(/))
#   select dir in $dirs; do
#     if [[ -n $dir ]]; then
#       cd $dir
#       nvim .
#       break
#     fi
#   done
# }

# function hopps() {
#   local dirs
#   pushd ~/Code >/dev/null  # Change to ~/code/my_projects directory and hide output
#   dirs=(*(/))
#   select dir in $dirs; do
#     if [[ -n $dir ]]; then
#       autostart $dir
#       break
#     fi
#   done
# }

# function cci-legacy() {
#     # Define session name and project path
#     local session_name="cci-main"
#     local project_path="$HOME/code/cleanercode/industriefreund/"

#     # Check if the tmux session already exists
#     if tmux has-session -t "$session_name" 2>/dev/null; then
#         if [ -n "$TMUX" ]; then
#             echo "Inside a tmux session. Switching to session '$session_name'..."
#             tmux switch-client -t "$session_name"
#         else
#             echo "Not inside a tmux session. Attaching to session '$session_name'..."
#             tmux attach-session -t "$session_name"
#         fi
#     else
#         echo "Creating new tmux session '$session_name'..."
#         # Create a new detached tmux session named 'ccif' in the desired directory
#         tmux new-session -d -s "$session_name" -c "$project_path" -n nvim

#         # Assuming you want to start nvim and run several commands like in the cci function
#         tmux send-keys -t "${session_name}:nvim" 'code .' C-m
#         tmux send-keys -t "${session_name}:nvim" 'git fetch' C-m
#         tmux send-keys -t "${session_name}:nvim" 'pnpm install' C-m
#         tmux send-keys -t "${session_name}:nvim" 'pnpm run dev' C-m

#         # Attach to the tmux session
#         tmux attach-session -d -t "${session_name}:nvim"
#     fi
# }

# function ccif-legacy () {
#     # The first argument to the function is the session name
#     local session_name="ccif"
#     local project_path="$HOME/code/cleanercode/industriefreund-appwrite-function-perspective-new-lead"

#     # Check if the tmux session already exists
#     if tmux has-session -t "$session_name" 2>/dev/null; then
#         if [ -n "$TMUX" ]; then
#             echo "Inside a tmux session. Switching to session '$session_name'..."
#             tmux switch-client -t "$session_name"
#         else
#             echo "Not inside a tmux session. Attaching to session '$session_name'..."
#             tmux attach-session -t "$session_name"
#         fi
#     else
#         echo "Creating new tmux session '$session_name'..."
#         # Create a new detached tmux session with the name provided in the argument
#         tmux new-session -d -s "$session_name" -c $project_path -n nvim

#         # Create a second window for the dev server, ensuring it starts in the same directory
#         # tmux new-window -t "$session_name" -n dev-server -c ~/code/cleanercode/industriefreund/
#         # In the 'dev-server' window, start the development server
#         tmux send-keys -t "${session_name}:nvim" 'code .' C-m
#         tmux send-keys -t "${session_name}:nvim" 'git fetch' C-m

#         # Attach to the tmux session
#         tmux attach-session -d -t "${session_name}:nvim"
#     fi
# }

# This function is used to setup a new project easy and fast
# TODO open tmux with a new session. Copy the example template into a new folder
# The user need to specify a name and one or more git repo url. Those repos will be cloned in my default projects folder and a .code-workspace will be created. 
#
# create 2 windows with nvim. one for the workspaces, one for the project setup bashscript (this is the easy one)
function createProject () {
  cp -rf ~/Code/example ~/Code/$1
  mv ~/Code/$1/example.sh ~/Code/$1/$1.sh
  mv ~/Code/$1/example.code-workspace ~/Code/$1/$1.code-workspace
}

function wad () {
  echo "Autostart Web Application Development"
  autostart webdev
}

function hgb () {
  echo "Autostart Grow Box"
  autostart growbox
}

function cci () {
  echo "Autostart Cleaner Code industriefreund"
  autostart industriefreund
}

# clone-new <name> <git-repo-url> <short-name>
function clone-new() {
  # if [ -n "$1" ]; then
  #   echo "Please provide a name for the autostart directory as the 1st argument."
  # fi

  # if [ -n "$2" ]; then
  #   echo "Please provide a git repo URL as the 2nd argument."
  # fi

  # if [ -n "$3" ]; then
  #   echo "Please provide a short name URL as the 3nd argument."
  # fi

  # Check if the target directory does not exist and then proceed
  if [ ! -d "~/Code/$1" ]; then
    # Copy the example directory to a new location based on the first argument
    createProject $1
  else
    echo "The directory ~/Code/$1 already exists. Adding the repo"
  fi

  cd ~/Code/$1/repos
  git clone "$2"

  # Append a function to the .zshrc file using the variable for the function name
  echo "function $3() { echo \"Autostart $1\"; autostart $1; }" >> ~/.zshrc
  
  # Reload .zshrc to apply changes immediately (optional, can be removed if not wanted)
  source ~/.zshrc

  # Open the directory in VS Code
  code ~/Code/$1
}


function exampleproject () {
  # Replace example with the name of the folder inside ~/Code, of your project
  autostart example
}

function autostart () {
    # Project folder name
    if [ -n "$1" ]; then
      # Check if the tmux session already exists
      if tmux has-session -t "$1" 2>/dev/null; then
          autostartexe $1 something
          echo "Session exists"
      else
          echo "Creating new tmux session '$1'..."
          # Create a new detached tmux session with the name provided in the argument
          tmux new-session -d -s "$1" -n nvim

          tmux send-keys -t "$1:nvim" "autostartexe $1" C-m
      fi

      if [ -n "$TMUX" ]; then
          echo "Inside a tmux session. Switching to session '$session_name'..."
          tmux switch-client -t "$1"
      else
          echo "Not inside a tmux session. Attaching to session '$session_name'..."
          tmux attach-session -t "$1"
      fi
    fi
}

function autostartexe(){
    # Project folder name
    if [ -n "$1" ]; then
      cd ~/Code/$1
    fi

    # Find a .code-workspace file in the current directory
    workspaceFile=$(find . -maxdepth 1 -name "*.code-workspace" -print -quit)

    if [ -n "$workspaceFile" ]; then
        # If found, open it with Visual Studio Code
        echo "Opening $workspaceFile with Visual Studio Code..."
        code "$workspaceFile"
    else
        echo "No .code-workspace file found in the current directory."
    fi

    if [ -n "$2" ]; then
        echo "$2 so we just open vscode execute it" 
    else
      # Find a .code-workspace file in the current directory
      bashScript=$(find . -maxdepth 1 -name "*.sh" -print -quit)

      if [ -n "$bashScript" ]; then
          # If found, open it with Visual Studio Code
          echo "Executing Project Setup $bashScript"
          ./$bashScript
      else
          echo "No .sh file found in the current directory."
      fi
    fi
}

function grow-box() {
    # Check if the tmux session already exists
    if tmux has-session -t grow-box 2>/dev/null; then
        echo "Session 'grow-box' already exists. Attaching to it..."
        # Attach to the existing tmux session
        tmux attach-session -t grow-box
    else
        echo "Creating new tmux session 'grow-box'..."
        # Create a new detached tmux session named 'industriefreund' in the desired directory
        # and immediately start nvim in the root window
        tmux new-session -d -s grow-box -c ~/hhn/grow-box/grow-box-frontend/grow-box-monitoringv2 -n nvim

        tmux new-window -n frontend -c ~/hhn/grow-box/grow-box-frontend/grow-box-monitoringv2
        tmux send-keys -t grow-box:frontend 'code .' C-m
        tmux send-keys -t grow-box:frontend 'pnpm run dev' C-m
        tmux new-window -n backend -c ~/hhn/grow-box/grow-box-embedded/ESP32_sensors_module_mqtt/
        tmux send-keys -t grow-box:backend 'code .' C-m
        
        # Attach to the tmux session
        tmux attach-session -d -t grow-box:frontend
    fi
}

function grow-box_function_2() {
  tmux new-session -d -s grow-box-session
  tmux new-window -n frontend -c ~/hhn/grow-box/grow-box-frontend/grow-box-monitoringv2
  tmux split-window -h -c ~/hhn/grow-box/grow-box-frontend/grow-box-monitoringv2
  tmux new-window -n backend -c ~/hhn/grow-box/grow-box-embedded/ESP32_sensors_module_mqtt/
  code . -n
  tmux split-window -v                  
  tmux attach-session -d -t grow-box-session
}

function grow-box_function() {
	local choice
     local options=("nuxt3-frontend" "esp-sensors" "esp-led" "esp-firebase")

     echo "Please select an option:"
     select choice in "${options[@]}"; do
       case $choice in
         "nuxt3-frontend")
           cd ~/hhn/grow-box/grow-box-frontend/grow-box-monitoringv2
           idea .
           ;;
         "esp-sensors")
           cd ~/hhn/grow-box/grow-box-embedded/ESP32_sensors_module_mqtt/
           code . -n
           ;;
         "esp-led")
           cd ~/hhn/grow-box/grow-box-embedded/led_steuerung/
           code . -n
           ;;
         "esp-firebase")
           echo "Not Yet Avalible"
           ;;
         *)
           echo "Invalid option $REPLY"
           ;;
       esac
       break
     done
}

function hhn() {
 #define options
 local options=("grow-box" "grow-box-2.0")

 echo "Please select an option:"

 local choice
 select choice in "${options[@]}"; do
   case $choice in
     "grow-box")
       grow-box_function
       ;;
     "grow-box-2.0")
       grow-box_function_2
       ;;
     *)
       echo "Invalid option $REPLY"
       ;;
   esac
   break
 done
}

alias zsh="code ~/.zshrc"

alias szsh="source ~/.zshrc"
# somehow not needed anymore, nvim plugin works
# https://neovim.io/doc/user/provider.html
# let g:python3_host_prog = '/Users/ballmend/.asdf/shims/python3'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# pnpm
export PNPM_HOME="/Users/ballmend/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# ----------------------
# Aliases
# ----------------------
alias v='nvim'

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }


export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
function dot() { echo "Autostart dotrepo"; autostart dotrepo; }
