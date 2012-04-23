typeset -U path # ensure unique paths within PATH
path=(/usr/local/bin $path)

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/Library/Frameworks/Python.framework/Versions/2.7/bin $path)
fi
