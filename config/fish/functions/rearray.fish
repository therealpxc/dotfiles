# Creates a fish regex replacement string using the supplied arguments as matching group names'
function rearray
  # these escapes are minimal. the '\n' literals need to be included so this can be passed
  # unescaped to (string replace $pattern $whatever $source)
  #string replace -r '.+' '\\\$\{$0\}' $argv
  string join '\n' (string replace -r '.+' '\\\$\{$0\}' $argv)
end
