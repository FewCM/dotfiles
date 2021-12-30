zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:(cd|ls|exa|bat|cat|v|z):*' fzf-preview 'exa -1 --color=always --icons --group-directories-first  ${realpath}'
zstyle ':fzf-tab:complete:((micro|vim|nvim|nano):argument-rest|kate:*)' fzf-preview 'bat --color=always -- $realpath 2>/dev/null || ls --color=always -- $realpath'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags '--preview-window=down:3:wrap'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '
        [[ $group == "[process ID]" ]] &&
          if [[ $OSTYPE == darwin* ]]; then
            ps -p $word -o comm="" -w -w
          elif [[ $OSTYPE == linux* ]]; then
            ps --pid=$word -o cmd --no-headers -w -w
          fi'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

# it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'|
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'
