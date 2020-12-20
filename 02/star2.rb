def bool_to_int(bool)
  bool ? 1 : 0
end

valids = 0
mask = /(?<pos1>\d+)-(?<pos2>\d+) (?<char>.): (?<pass>.+)/
File.readlines('input.txt').each do |line|
  str = line.chomp
  match_data=str.match(mask)
  c1 = match_data[:pass][match_data[:pos1].to_i - 1]
  c2 = match_data[:pass][match_data[:pos2].to_i - 1]
  valids += 1 if (bool_to_int(c1 == match_data[:char]) + bool_to_int(c2 == match_data[:char])) == 1
end
puts valids
