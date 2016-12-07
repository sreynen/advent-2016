cat 7-input.txt | grep -Ev "\[[a-z]*([a-z])([a-z])\2{1}\1{1}[a-z]*\]" | sed 's/\([a-z]\)\1\1\1/--/g' | grep -E "([a-z])([a-z])\2\1" | wc -l

# Remove all lines with abba patterns between [] (invalidates)
# Remove all aaaa patterns (don't count)
# Get all lines with abba patterns (valid matches)
# Count lines
