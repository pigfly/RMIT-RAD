# def foo_bar
#   puts "I am inside foo_bar method"
#   yield
#   puts "I am back in foo_bar method"
# end

# yield keyword is used when you want to call a block implictly
# do .. end, {...}


def foo_bar
  puts "I am inside foo_bar method"
  yield
  yield
  yield
  puts "I am back in foo_bar method"
end

foo_bar { puts "I'm in a block" }


def another_foo_bar
  yield 10
  yield 100
  yield 1000
end

another_foo_bar { |data| puts "data #{data} TB" }

def questionable_method
  return "no block passed in" if block_given?
end

questionable_method