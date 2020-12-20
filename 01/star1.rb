pairs = []
File.readlines('input.txt').each do |line|
  number = line.chomp.to_i
  diff = 2020 - number
  if pairs.include?(diff)
    puts diff * number
  else
    pairs << number
  end
end
