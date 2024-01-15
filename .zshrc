export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="osx2"
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  bgnotify
  zsh-fzf-history-search
)

PATH="$PREFIX/bin:$HOME/.local/bin:$HOME/go/bin:$PATH"
export PATH

LINK="https://github.com/mayTermux"
export LINK

LINK_SSH="git@github.com:mayTermux"
export LINK_SSH

export TERM=xterm-256color 

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lf/icons
source $HOME/.autostart

sshd

# User configuration

alias dev='am start -a android.settings.APPLICATION_DEVELOPMENT_SETTINGS'
alias rish='~/.scripts/custom/rish'

### disable underline in zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

### EXPORT
export EDITOR='nvim' # $EDITOR use nvim in terminal

### "bat" as manpager
export MANPAGER='nvim +Man!'

### VARIABLES
PKG_BKUP_PATH="$HOME/.backup/packages.txt"
IP='192.168.29.100'

### ALIASES ###

# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first'     # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -al --color=always --group-directories-first' # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | grep -E "^\."'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# bare git repo alias for dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ctig='GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME tig'

function cfg(){
  if [[ "$#" -eq 0 ]]; then
    (cd /
    for i in $(config ls-files); do
      echo -n "$(config -c color.status=always status $i -s | sed "s#$i##")"
      echo -e "¬/$i¬\e[0;33m$(config -c color.ui=always log -1 --format="%s" -- $i)\e[0m"
    done
    ) | column -t --separator=¬ -T2
  else
    config $*
  fi
}

# pkg and pip update
alias pkgu='pkg up -y'
alias pipu='if [[ $(pip list --outdated | wc -l) -gt 2 ]]; then pip list --outdated --format=columns | awk '\'"{print $1}"\'' | tail -n +3 | xargs -n1 pip install -U; else echo "No outdated packages to upgrade"; fi'
alias cleanup='pkg clean && apt autoremove && pip cache purge'

# pkg packages & apps list
alias backup='printf "# pkg\n" > $PKG_BKUP_PATH && dpkg -l | grep "^ii" | awk "{print \$2}" >> $PKG_BKUP_PATH && printf "done\n"'
alias apps='adb shell pm list packages | sed 's/package://' | sort > ~/.backup/apps.txt'

# refresh zsh
alias refresh='source ~/.zshrc'

# edit conf
alias aliasconf='nvim ~/.zshrc'
alias backupconf='nvim ~/.backup/README.md'

# it db
it() {
	grep --color='auto' --ignore-case "$1" ~/IT_DB.txt
}

# go to home
alias home='cd ~/storage/shared/'

# user script
alias mull='~/.scripts/custom/mull.sh'
alias blocklist='~/.scripts/custom/blocklist.sh'
alias short='~/.scripts/custom/short.sh'

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init zsh)"

### OTHERS ###

# fzf
alias preview="fzf --preview='bat --color=always --style=numbers --theme OneHalfDark {}' --preview-window=down"

#Change
alias chcolor="~/.scripts/colorscheme/colors.sh"
alias chfont="~/.scripts/fonts/fonts.sh"
alias chzsh="~/.scripts/zsh/changetheme.sh"

#Config
alias fontused="cat ~/.config/mytermux/fonts/used.log"
alias colorused="cat ~/.config/mytermux/colorscheme/used.log"
alias zshused="cat ~/.config/mytermux/zsh/used.log"

#System    
alias q="exit"
# alias c="clear"
alias sd="cd /sdcard"
alias pf="cd $PREFIX"

#Package Manager
alias pacupg="pkg upgrade"
alias pacupd="pkg update"
alias pacupgupd="pkg update && pkg upgrade"

#Convert Video
alias convi="ffmpeg -i $1 -c:v libx264 -crf 25 $2"

#Ping    
alias pg="ping google.com"

#MyIP (Local) Pre
alias myip="bash ~/.scripts/system/ip.sh simcard"
alias myipwifi="bash ~/.scripts/system/ip.sh wifi"
alias myiphotspot="~/.scripts/system/ip.sh hotspot"
alias myipvpn="~/.scripts/system/ip.sh vpn"
alias myipall="~/.scripts/system/ip.sh all"

#Music    
alias n="ncmpcpp"
alias mkill="mpd --kill"
alias m="music"
alias ncmpcpp-compile="~/myTermux/compile/install/ncmpcpp-compile.sh"

#Color Toys
alias 256colors2="~/.scripts/toys/256colors2.pl"
alias bloks="~/.scripts/toys/bloks"
alias colortest="~/.scripts/toys/colortest"
alias colortest-slim="~/.scripts/toys/colortest-slim"
alias colorview="~/.scripts/toys/colorview"
alias colorbars="~/.scripts/toys/colorbars"
alias panes="~/.scripts/toys/panes"
alias pipes1="~/.scripts/toys/pipes1"
alias pipes2="~/.scripts/toys/pipes2"
alias pipes2-slim="~/.scripts/toys/pipes2-slim"
alias dna="~/.scripts/toys/dna"
alias ghost="~/.scripts/toys/ghost"
alias jfetch="~/.scripts/toys/jfetch"
alias pacman="~/.scripts/toys/pacman"
alias pipesx="~/.scripts/toys/pipesx"
alias rains="~/.scripts/toys/rains"
alias spacey="~/.scripts/toys/spacey"

#archives .deb
alias archives="cd /data/data/com.termux/cache/apt/archives/"

#Photos
alias ss="cd /sdcard/Pictures/Screenshots/"

#Movies
alias ms="cd /sdcard/Movies"

#Downloads
alias dl="cd /sdcard/Download"

#Documents
alias ds="cd /sdcard/Documents"

#Largest Files
alias largefile="du -h -x -s -- * | sort -r -h | head -20"

#System Information
#alias neo="bash ~/.config/neofetch/debug-logo.sh --randomsmall"
alias neo="neofetch"
alias neodebug="bash ~/.config/neofetch/debug-logo.sh $1"
alias disk="bash ~/.scripts/system/fetch.sh storage"
alias battery="bash ~/.scripts/system/fetch.sh battery"
# alias ls="exa --icons"
# alias la="exa --icons -lgha --group-directories-first"
# alias lt="exa --icons --tree"
alias lta="exa --icons --tree -lgha"
alias bat="bat --theme OneHalfDark"
alias cat="bat --theme OneHalfDark -p $@"

#proot-distro
alias prot="cd $PREFIX/var/lib/proot-distro"
alias protlogin="proot-distro login $1"

#Magick
alias listfont="magick convert -list font | grep -iE 'font:.*'"

## Configuration

#mpd
alias mpdconf="nvim ~/.config/mpd/mpd.conf"
alias mpconf="nvim /data/data/com.termux/files/usr/etc/mpd.conf"

#ncmpcpp    
alias ncmconf="nvim ~/.config/ncmpcpp/config"

#neovim
alias nviminit="nvim ~/.config/nvim/init.lua"
alias nvimtheme="nvim ~/.config/nvim/lua/chadrc.lua"
alias nvimplug="nvim ~/.config/nvim/lua/pluginList.lua"
alias nvimmap="nvim ~/.config/nvim/lua/mappings.lua"
alias nvimpacnit="nvim ~/.config/nvim/lua/packerInit.lua"
alias nvimsin="nvim ~/.config/nvim/lua/core/xshin.lua"
alias nvimhighlight="nvim ~/.config/nvim/lua/hightlights.lua"
alias nvimcore="nvim ~/.config/nvim/lua/core/init.lua"

#zsh
alias zshconf="nvim ~/.zshrc"

#neofetch    
alias neoconf="nvim ~/.config/neofetch/config.conf"
alias rxconf="nvim ~/.local/bin/rxfetch"
alias neoscript="nvim ~/.config/neofetch/script.sh"
alias fetch="bash ~/.scripts/system/fetch.sh $@"
alias fetchconf="nvim ~/.scripts/system/fetch.sh"

alias awesomeconf="nvim ~/.config/awesomeshot/awesomeshot.conf"

#git
alias gitgraph="git log --all --decorate --oneline --graph"
alias gitupdate="git fetch && git pull"
alias gitstat="git status"
alias gitad="git add $@"
alias gitcom="git commit -m '$@'"

#Web Server (Require install LAMP on Termux) https://github.com/xshin404/lampTermux
alias apaconf="nvim $PREFIX/etc/apache2/httpd.conf"
alias phpmyadminconf="nvim $PREFIX/etc/phpmyadmin/config.inc.php"

#Refresh
# alias refresh="source $HOME/.zshrc"

#Unsource
alias unsource="exec $SHELL -l"

#PID Login
alias loginconf="nvim ~/.scripts/login.sh"
alias exit="if [ -f ~/.scripts/pid/login ]; then rm ~/.scripts/pid/login; fi && exit"

#MyIP
alias myipconf="nvim ~/.scripts/ip.sh"

#termux-reload
alias reload="termux-reload-settings"

#termux-setting
alias termconf="nvim ~/.termux/termux.properties"

#termux-permission
alias termper="termux-setup-storage"

# alias aliasconf="nvim ~/.aliases"
alias startconf="nvim ~/.autostart"

alias repocek="node ~/.scripts/js/repochecker.js"

alias schemeconf="nvim ~/.scripts/colorscheme/colors.sh"
alias fontsconf="nvim ~/.scripts/fonts/fonts.sh"
alias zshthemeconf="nvim ~/.scripts/zsh/changetheme.sh"

# Termux:API
alias scan="termux-media-scan"
alias open="termux-open"
