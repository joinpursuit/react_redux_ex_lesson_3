require 'byebug'
class Array
  def my_each (&prc)
    counter = 0
    while counter < self.length
      prc.call(self[counter])
      counter += 1
    end
  end

  def my_select (&prc)
    answer = []
    self.each_index do |i|
      if prc.call(self[i]) == true
        answer << self[i]
      end
    end
    answer
  end

  def my_reject (&prc)
    answer = []
    self.each_index do |i|
      if prc.call(self[i]) == false
        answer << self[i]
      end
    end
    answer
  end

  def my_any? (&prc)
    self.each do |l|
      if prc.call(l)
        return true
      end
    end
    false
  end

  def my_all? (&prc)
    self.each do |l|
      unless prc.call(l)
        return false
      end
    end
    true
  end

  def my_flatten
    result = []
    each do |el|
      if el.class != Array
        result << el
      else
        result += el.my_flatten
      end
    end
    result
  end

  def my_zip (*args)
    result = []
    each_with_index do |el, i|
      arr = [el]
      args.each do |el|
        arr << el[i]
      end
      result << arr
    end
    result
  end

  def my_rotate(num = 1)
    if num >= 0
      num.times do
        self.push(self.shift)
      end
    else
      num.abs.times do
        self.unshift(self.pop)
      end
    end
    self
  end

  def my_join(seperator = "")
    result = ""
    each_with_index do |ch, i|
      result << ch
      next if i == length - 1
      result << seperator
    end
    result
  end

  def my_reverse
    result = []
    each_with_index do |el, i|
      result << self[-(i + 1)]
    end
    result
  end

  def bubble_sort!(&prc)
    sorted = false
    until sorted == true
      sorted = true
      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    sorted = false
    until sorted == true
      sorted = true
      (0...arr.length - 1).each do |i|
        if prc.call(arr[i], arr[i+1]) == 1
          arr[i], arr[i+1] = arr[i+1], arr[i]
          sorted = false
        end
      end
    end
    arr
  end

end

def factors(num)
  (1..num).select { |n| num % n == 0 }
end

def substrings(string)
  n = 1
  arr = []
  while n <= string.length
    string.chars.each_cons(n) do |str|
      arr << str.join
    end
    n += 1
  end
  arr
end

def subwords(word, dictionary)
  strings = substrings(word)
  strings.select { |word| dictionary.include?(word) }
end
