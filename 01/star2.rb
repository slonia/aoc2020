numbers = File.readlines('input.txt').map { |n| n.chomp.to_i }.sort
l = numbers.size-1
found = false
numbers.each_with_index do |n, i|
  diff1 = 2020-n
  ((i+1)..l).each do |j|
    num = numbers[j]
    diff2 = diff1-num
    if numbers.include?(diff2)
      puts n*num*diff2
      found = true
      break
    end
  end
  break if found
end
