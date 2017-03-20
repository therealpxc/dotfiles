# Creates a fish regex replacement string using the supplied arguments as matching group names'
function rearray
  string replace -r '.+' '\\\$\{$0\}' $argv
end
