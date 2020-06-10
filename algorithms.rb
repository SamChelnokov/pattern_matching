# Brute Force
def brute_search string, pattern
  pattern_length = pattern.length
  results = []
  for string_index in (0... string.length)
    match_count = 0
    loop do
      break if string[string_index + match_count] != pattern[match_count]
      match_count += 1
      if match_count == pattern_length
        results << string_index
        break
      end
    end
  end
  return results
end

# Knuth-Morris-Pratt
def kmp_table pattern, pattern_length
  prefix_table = [0]
  match_count = 0
  (1...pattern_length).each do |pattern_counter|
    if (match_count > 0 && (pattern[match_count] != pattern[pattern_counter]))
      match_count = prefix_table[match_count -1] || 0
    end
    if pattern[match_count] == pattern[pattern_counter]
      match_count += 1
    end
    prefix_table[pattern_counter] = match_count
  end
  return prefix_table
end

def kmp string, pattern

  string_length = string.length
  pattern_length = pattern.length
  table = kmp_table pattern, pattern_length
  results = []

  string_counter, pattern_counter, potential_match_index = 0, 0, 0
  prefix_table_length = table.length

  while string_length - potential_match_index > prefix_table_length - 1 do
    while pattern_counter < prefix_table_length - 1  && string[string_counter ] == pattern[pattern_counter] do
      string_counter += 1
      pattern_counter += 1
    end
    if pattern_counter >= prefix_table_length - 1
    results << potential_match_index
    end
    if table[pattern_counter - 1] !=nil && table[pattern_counter - 1] > 0
      potential_match_index = string_counter - table[pattern_counter -1]
    else
      if string_counter == potential_match_index
        string_counter += 1
      end
      potential_match_index = string_counter
    end
    if pattern_counter > 0
      pattern_counter = table[pattern_counter -1]
    end
  end
  results
end

# karp-rabin
def karp_rabin string, pattern
  found = []
  current_index = -1
  while current_index = string.index(pattern, current_index+1)
    found << current_index
  end
  found
end
