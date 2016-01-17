eval sh $HOME/.config/base16-default.dark.sh

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
