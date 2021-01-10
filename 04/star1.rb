required = %w(byr iyr eyr hgt hcl ecl pid)

passports = File.read('input.txt').split("\n\n")

valid = 0

passports.each do |pass|
  entries = pass.split(/\s+/).map { |e| e.split(':')[0] }
  next if entries.size < 7
  valid += 1 if required.all? { |field| entries.include?(field) }
end

puts valid
