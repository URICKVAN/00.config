# ======================================================================
# ARCHIVO: aliases.zsh  |  UBICACIÓN: /Users/iurickvan/Documents/00.config/01.zsh/aliases.zsh
# Archivo centralizado de alias para Zsh. Editar aquí y luego ejecutar `source ~/.zshrc`.
# ======================================================================

alias ls='ls -lG'      # Lista en formato largo y con colores
alias ll='ls -laG'     # Lista todo (incl. ocultos) en largo y colores
alias la='ls -la'      # Lista todo (incl. ocultos) en largo sin colores

alias addkey='sh /Users/iurickvan/Documents/00.config/00.ssh/add_ssh_key.sh'  # Ejecuta script para agregar llave SSH

alias cdu='cd /Users/iurickvan/'  # Salta directo al directorio home de iurickvan
alias startssh='sh /Users/iurickvan/Documents/00.config/00.ssh/start-ssh-agent.sh'  # inicializa las keys ssh
