# Only run in env 'cloud'.
if [ "$MYCONFIG_ENV" != "cloud" ]; then
  return
fi
echo "Loading cloud config."

# Skip if not running interactively.
[ -z "$PS1" ] && return
