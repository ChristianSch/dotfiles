# eval sh $HOME/.config/base16-default.dark.sh
eval (python -m virtualfish)

export LC_ALL=en_US.UTF-8
export LOCALE=en_US.UTF-8

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
        set last_status $status

		printf "["
		printf (date "+%H:%M:%S")
		printf "] "

		if [ $last_status -ne 0 ]
			printf "exit: "
			printf $fish_error_color $last_status
            printf " "
			set -ge status
		end

        set_color blue

		# Track the last non-empty command. It's a bit of a hack to make sure
		# execution time and last command is tracked correctly.
        set -l now (date +%s)

		set -l cmd_line (commandline)
		#if test -n "$cmd_line"
		#	set -g last_cmd_line $cmd_line
		#	set -ge new_prompt
		#else
		#	set -g new_prompt true
		#end

		# Show last execution time and growl notify if it took long enough
		#if test $last_exec_timestamp
		#	set -l taken (math $now - $last_exec_timestamp)
        #
		#	if test $taken -gt 10 -a -n "$new_prompt"
		#		printf "taken "
		#		printf $fish_color_error $taken
		#		set_color blue
		#		osascript -e "display notification \"returned after: $taken s\" with title \"$last_cmd_line\""
		#		# Clear the last_cmd_line so pressing enter doesn't repeat
		#		set -ge last_cmd_line
		#	end
		#end
		#set -g last_exec_timestamp $now

        printf '%s' (prompt_pwd)
        printf '%s ' (__fish_git_prompt)
        set_color white

        printf "\n"
        if set -q VIRTUAL_ENV
            echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
        end

        # set_color red
        # printf ' >'
        # set_color yellow
        # printf '>'
        # set_color green
        # printf '> '
        # set_color green

        set_color blue
        printf 'λ '
end

setenv EDITOR nvim
setenv BROWSER firefox

set fish_greeting
