eval sh $HOME/.config/base16-default.dark.sh
# set nord theme:
# https://github.com/ryanoasis/nerd-fonts
# set -g theme_color_scheme nord

# fish git prompt
# set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
# set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
        set last_status $status
        set_color blue
        printf '%s' (prompt_pwd)
        set_color red
        printf ' >'
        set_color yellow
        printf '>'
        set_color green
        printf '> '
        set_color green
        printf '%s ' (__fish_git_prompt)
end

if status is-interactive
and not set -q TMUX
    exec tmux
end
clear


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
