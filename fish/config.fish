alias ls=exa

abbr -a c cargo
abbr -a e nvim
abbr -a m make

# git
abbr -a gs  git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gpl git pull
abbr -a gl  git l
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage
abbr -a gco git checkout
abbr -a gsu git submodule update --init --recursive

# tmux
abbr -a t tmux
abbr -a ta tmux attach

# ls
alias l='exa -l'
alias la='exa -a'
alias lla='exa -la'
alias lt='exa --tree'

eval (ssh-agent -c &)
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -Ux SSH_AGENT_PID $SSH_AGENT_PID
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 12 

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	if [ $PWD != $HOME ]
		set_color brblack
		set_color yellow
		echo -n (pwd | sed "s|^$HOME|~|")
	else
		set_color yellow
		echo -n '~/'
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end


# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.local/bin
set -x PICODATA_EXECUTABLE $HOME/picodata/picodata/target/debug/picodata
set -x LUA_CPATH "$HOME/picodata/pgproto/target/debug/?.so"
