cat 7-input.txt | sed 's/\(\[[a-z]*\]\)\(.\{1,\}\)/-\2-\1/g' | sed 's/\(\[[a-z]*\]\)\(.\{1,\}\)/-\2-\1/g' | sed 's/\(\[[a-z]*\]\)\(.\{1,\}\)/-\2-\1/g' | sed 's/\(\[[a-z]*\]\)\(.\{1,\}\)/-\2-\1/g' | sed 's/\([a-z]\)\1\1/\1--\1/g' | grep -E "^[^\[]*([a-z])([a-z])\1.*\[.*\2\1\2" | wc -l

# Move all [] to the end (repeat 4 times, just to be sure)
# Split all aaa patterns (don't count)
# Find all aba before [, followed by bab after [
# Count lines
