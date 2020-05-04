def myMethod1(a, b) 
  (a.to_f + b) / 2
end

puts myMethod1(-10, 10)

# // variable length parameter
def myMethod2(*arg)
  arg.sum / arg.length.to_f
end

puts myMethod2(5, 10, 11, 1000)

def myMethod3(*arg)
  return arg.minmax
end

puts myMethod3(-100, 0, 100)