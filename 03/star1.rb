field = File.read('input.txt').split("\n")
x_pos = 0
trees = 0
field.each_with_index do |row, index|
  next if index.zero?
  x_pos += 3
  x_pos = x_pos - row.size if x_pos >= row.size
  trees += 1 if row[x_pos] == '#'
end
puts trees
