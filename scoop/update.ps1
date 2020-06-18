$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
cd $ScriptPath
scoop update *
scoop export > export.txt