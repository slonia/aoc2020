field = File.read('input.txt').split("\n")

def traverse_field(field, x_step, y_step)
  x_pos = 0
  y_pos = 0
  trees = 0
  row_size = field[0].size
  while y_pos + y_step < field.size
    x_pos += x_step
    y_pos += y_step
    x_pos = x_pos - row_size if x_pos >= row_size
    trees += 1 if field[y_pos][x_pos] == '#'
  end
  trees
end

steps = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

total = 1
steps.each do |x_step, y_step|
  total *= traverse_field(field, x_step, y_step)
end
puts total
