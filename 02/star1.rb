valids = 0
mask = /(?<from>\d+)-(?<to>\d+) (?<char>.): (?<pass>.+)/
File.readlines('input.txt').each do |line|
  str = line.chomp
  match_data=str.match(mask)
  cnt = match_data[:pass].count(match_data[:char])
  valids += 1 if cnt >= match_data[:from].to_i && cnt <= match_data[:to].to_i
end
puts valids
