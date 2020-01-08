if ((!$+commands[npm])); then
   return 1
 fi

 # Adds node_modules/.bin to the PATH
 npm_bin_hook() {
   if [ -n "${OLDPATH+x}" ]; then
     PATH=$OLDPATH
     unset OLDPATH
   fi
   if [ -f package.json ]; then
     OLDPATH=$PATH
     PATH=$PWD/node_modules/.bin:$PATH
   fi
 }

 add-zsh-hook chpwd npm_bin_hook
