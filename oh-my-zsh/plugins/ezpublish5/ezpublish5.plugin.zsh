# eZ Publish 5 basic command completion

_ezpublish5_get_command_list () {
	php $(find . -maxdepth 2 -mindepth 1 -name 'console')  --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_ezpublish5 () {
  if [ -f $(find . -maxdepth 2 -mindepth 1 -name 'console')  ]; then
    compadd `_ezpublish5_get_command_list`
  fi
}

compdef _ezpublish5 $(find . -maxdepth 2 -mindepth 1 -name 'console')
compdef _ezpublish5 ez

# Alias Symfony
alias ez='php $(find . -maxdepth 2 -mindepth 1 -name 'console') '
alias ezcl='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  cache:clear'
alias ezcw='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  cache:warmup'
alias ezroute='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  router:debug'
alias ezcontainer='php $(find . -maxdepth 2 -mindepth 1 -name 'console') container:debug'
alias ezgb='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  generate:bundle'

# Alias new stack 
alias ezdumpref='php $(find . -maxdepth 2 -mindepth 1 -name 'console') config:dump-reference ezpublish'

# Alias legacy stack
alias ezlcl='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  ezpublish:legacy:script bin/php/ezcache.php'
alias ezlcla='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  ezpublish:legacy:script bin/php/ezcache.php --clear-all'
alias ezlautoloads='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  ezpublish:legacy:script bin/php/ezpgenerateautoloads.php'
alias ezlcronjobs='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  ezpublish:legacy:script runcronjobs.php'
alias ezlassets='php $(find . -maxdepth 2 -mindepth 1 -name 'console')  ezpublish:legacy:assets_install --symlink'

