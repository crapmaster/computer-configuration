# Use meld as diff viewer
alias svndiff='svn diff --diff-cmd meld' 

# Alias for rm command, I want to be prompted before removing files
alias rm='rm -i'

# Alias for cp command, I want to be prompted before overwriting files
alias cp='cp -i'

# Alias for mv command, I want to be prompted before overwriting files
alias mv='mv -i'

# Calculate disk space
alias space='du -csxkh *'

# Clear trash
alias clear-trash='rm -rf ~/.local/share/Trash/*'

# Remove double spaces from file and directory names
alias removedoublespace="rename 's/  / /' *"

# CMe2100LTEG2 aliases
alias decrypt2100g2='python3  /home/petjan/Projects/Elvaco/github/2100/scripts/CommandCrypto/main.py --key abcdefgh12345678 --serial 0191990001 --decrypt '
alias encrypt2100g2='python3  /home/petjan/Projects/Elvaco/github/2100/scripts/CommandCrypto/main.py --key abcdefgh12345678 --serial 0191990001 --encrypt '

