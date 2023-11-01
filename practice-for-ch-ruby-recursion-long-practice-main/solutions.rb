# Warmup

def range(start, end_range)
  return [] if end_range < start
  return [start] if start == end_range
  return [start] if start == end_range - 1

  range(1, end_range - 1) << end_range - 1
end

# p range(4, 1) == []
# p range(1, 1) == [1]
# p range(1, 2) == [1]
# p range(2, 2) == [2]
# p range(2, 3) == [2]
# p range(1, 3) == [1, 2]
# p range(1, 4) == [1, 2, 3]
# p range(1, 5) == [1, 2, 3, 4]

def sum_iterative(arr)
  arr.reduce { |sum, num| sum + num }
end

# p sum_iterative([1,2,3,4,5])

def sum_recursive(arr)
  return 0 if arr.empty?
  return arr[0] if arr.length == 1

  arr[0] + sum_recursive(arr[1..])
end

# p sum_recursive([1,2,3,4,5])

def exp_v1(base, exponent)
  return 1 if exponent.zero?
  return base if exponent == 1

  base * exp_v1(base, exponent - 1)
end

# p exp_v1(2,3)
# p exp_v1(2,4)

def exp_v2(base, exponent)
  return 1 if exponent.zero?
  return base if exponent == 1

  if exponent.even?
    square_root_ans = exp_v2(base, exponent / 2)
    square_root_ans * square_root_ans
  else
    # x = square_root_ans_over_base
    x = exp_v2(base, (exponent - 1) / 2)
    x * x * base
  end
end

# p exp_v2(2,3)
# p exp_v2(2,6)

def deep_dup(element)
  return element.dup unless element.is_a?(Array) # element is not an array

  arr = element
  arr.dup if arr.none?(Array)

  # return arr.map {|e| deep_dup(e)}

  deep_duped_arr = []
  arr.each do |ele|
    deep_duped_arr << deep_dup(ele)
  end
  deep_duped_arr
end

robot_parts = [
  %w[nuts bolts washers],
  %w[capacitors resistors inductors]
]

robot_parts_copy = deep_dup(robot_parts)

# shouldn't modify robot_parts
robot_parts_copy[1] << 'LEDs'
# but it does
p robot_parts[1] != robot_parts_copy[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def fib_iter(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  final = [0, 1]
  while final.length < n
    final << final[-1] + final[-2]
  end
  final
end

# p fib_iter(0) == []
# p fib_iter(1) == [0]
# p fib_iter(2) == [0, 1]
# p fib_iter(3) == [0, 1, 1]
# p fib_iter(4) == [0, 1, 1, 2]
# p fib_iter(5) == [0, 1, 1, 2, 3]
# p fib_iter(6) == [0, 1, 1, 2, 3, 5]
# p fib_iter(7) == [0, 1, 1, 2, 3, 5, 8]

def fib_recursive(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  prev_result = fib_recursive(n - 1)
  prev_result << prev_result[-1] + prev_result[-2]
end

# p fib_iter(0) == []
# p fib_recursive(1) == [0]
# p fib_recursive(2) == [0, 1]
# p fib_recursive(3) == [0, 1, 1]
# p fib_recursive(4) == [0, 1, 1, 2]
# p fib_recursive(5) == [0, 1, 1, 2, 3]
# p fib_recursive(6) == [0, 1, 1, 2, 3, 5]
# p fib_recursive(7) == [0, 1, 1, 2, 3, 5, 8]

def bsearch(arr, target)
   if arr.length == 1
    return nil if arr[0] != target
    return 0
   end

   idx_mid = (arr.length / 2).to_i
   first_half = arr[...idx_mid]
   second_half = arr[idx_mid..]

   first_result = bsearch(first_half, target)
   second_result = bsearch(second_half, target)

   return first_result if !first_result.nil?

   return second_result + first_half.length if !second_result.nil?

   nil
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil