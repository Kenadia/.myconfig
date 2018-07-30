# Only run in env 'cloud'.
if [ "$MYCONFIG_ENV" != "laptop" ]; then
  return
fi
echo "Loading cloud config."

# Skip if not running interactively.
[ -z "$PS1" ] && return
