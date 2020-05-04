array = [1, 2, 3, 4]

array.each { |item| puts item if item % 2 == 1 }

array.each do |item|
  puts item if item % 2 == 1
end