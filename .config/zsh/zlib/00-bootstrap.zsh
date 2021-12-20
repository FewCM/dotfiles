_zsh-history-substring-search-setting() {
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white'
HISTORY_SUBSTRING_SEARCH_FUZZY=1
bindkey "${key[Up]}"   history-substring-search-up
bindkey "${key[Down]}" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
}

_zsh_autosuggest_setting() {
	# Remove forward-char widgets from ACCEPT
	ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
	
	# Add forward-char widgets to PARTIAL_ACCEPT
	ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

	#bindkey '^ ' autosuggest-accept
	bindkey '^[[C' forward-word
	bindkey "${terminfo[kcuf1]}" forward-word
	ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
	ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=orange"
	ZSH_AUTOSUGGEST_USE_ASYNC=true
	ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
	ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c100,)" # Do not consider 100 character entries
	ZSH_AUTOSUGGEST_COMPLETION_IGNORE="[[:space:]]*"   # Ignore leading whitespace
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)
}
