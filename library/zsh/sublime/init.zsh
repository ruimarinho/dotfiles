local sublime_paths > /dev/null 2>&1
sublime_paths=(
    "/usr/local/bin/subl"
    "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
    "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
    "$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
    "$HOME/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
)

for sublime_path in $sublime_paths ; do
    # Set alias for available commands.
    if [[ -a $sublime_path ]]; then
        alias subl="'$sublime_path'"
        break
    fi
done
