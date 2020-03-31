def myMethod1(a, b) 
  (a.to_f + b)/2
end

puts myMethod1(-10, 10)

def myMethod2(*arg)
  arg.sum / arg.length.to_f
end

puts myMethod2(5, 10, 11, 1000)