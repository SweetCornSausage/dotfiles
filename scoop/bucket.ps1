$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
cd $ScriptPath
# extras
scoop bucket add extras
# games
scoop bucket add games
# nerd-fonts
scoop bucket add nerd-fonts
# java
scoop bucket add java
# nonportable
scoop bucket add nonportable
# versions
scoop bucket add versions
# nirsoft
scoop bucket add nirsoft
# Ash258
scoop bucket add Ash258 https://github.com/Ash258/Scoop-Ash258.git
# dorado
scoop bucket add dorado https://github.com/chawyehsu/dorado
# scoop-completion
scoop bucket add scoop-completion https://github.com/Moeologist/scoop-completion