required = {
  'byr' => -> (val) {
    val.to_i.between?(1920, 2002)
  },
  'iyr' => -> (val) {
    val.to_i.between?(2010, 2020)
  },
  'eyr' => -> (val) {
    val.to_i.between?(2020, 2030)
  },
  'hgt' => -> (val) {
    (val.to_s.end_with?('cm') && val.to_i.between?(150, 193)) ||
      (val.to_s.end_with?('in') && val.to_i.between?(59, 76))
  },
  'hcl' => -> (val) {
    val.to_s.size == 7 && !val.to_s.match(/#[0-9a-f]{6}/).nil?
  },
  'ecl' => -> (val) {
    %w[amb blu brn gry grn hzl oth].include?(val)
  },
  'pid' => -> (val) {
    val.to_s.size == 9 && !val.to_s.match(/\d{9}/).nil?
  }
}

passports = File.read('input.txt').split("\n\n")

valid = 0

passports.each do |pass|
  entries = Hash[pass.split(/\s+/).map {|a| a.split(':')}]
  next if entries.keys.size < 7
  next unless required.all? do |field, validation|
    res = validation.call(entries[field])
  end
  valid += 1
end

puts valid
