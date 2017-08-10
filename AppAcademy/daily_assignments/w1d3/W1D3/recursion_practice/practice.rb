class Array
  def quicksort
    return self if self.length <= 1
    hinge = self[0]
    less_than = self.drop(1).select { |el| el <= hinge }
    greater_than = self.select { |el| el > hinge }

    less_than.quicksort + [hinge] + greater_than.quicksort
  end
end
