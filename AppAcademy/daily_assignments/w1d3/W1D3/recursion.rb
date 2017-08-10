require 'byebug'

def range(start, ending)
  return [] if ending < start
  new_ending = ending - 1
  return [start] if start == new_ending
  range(start, new_ending) + [new_ending]
end

def iterative_range(start, ending)
  new_arr = []
  (start...ending).each {|el| new_arr << el}
  new_arr
end

def exp1(b,n)
  return 1 if n == 0
  exp1(b, n - 1) * b
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    component = exp2(b, n/2)
    component * component
  else
    component2 = exp2(b, (n-1)/2)
    b * component2 * component2
  end
end

class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.class == Array
        new_arr << el.deep_dup
      else
        new_arr << el
      end
    end
    new_arr
  end
end

def fib(n)
  return [0, 1] if n == 2
  component = fib(n - 1)
  component + [(component[-2] + component[-1])]
end

def subsets(arr)
  return [[]] if arr.empty?

  component = subsets(arr[0...-1])
  component2 = component.map { |el| el + [arr.last] }

  component + component2
end

def perm(arr)
  return [arr] if arr.length <= 1
  prev_perms = perm(arr[0...-1])
  results = []
  l = arr.last
  prev_perms.each do |el|
    (0..el.length).each do |idx|
      results << el.dup.insert(idx, l)
    end
  end
  results
end
