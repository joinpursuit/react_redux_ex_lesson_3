require 'byebug'

def sum_to(n)
  return n if n == 1
  return nil if n < 1
  n + sum_to(n - 1)
end

def add_numbers(arr)
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return flavors.include?(favorite) if flavors.length <=1
  if flavors.shift == favorite
    return true
  end
  ice_cream_shop(flavors, favorite)
end

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0]
end
