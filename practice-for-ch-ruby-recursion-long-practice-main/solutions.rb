# Warmup

def range(start, end_range)
  return [] if end_range < start
  return [start] if start == end_range
  return [start] if start == end_range - 1


  range(1, end_range - 1 ) << end_range - 1
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
    arr.reduce { |sum, num| sum + num}
end

# p sum_iterative([1,2,3,4,5]) 

def sum_recursive(arr)
    return 0 if arr.empty?
    return arr[0] if arr.length == 1

    arr[0] + sum_recursive(arr[1..])
end

# p sum_recursive([1,2,3,4,5]) 

def exp_v1(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1

    base * exp_v1(base, exponent - 1)
end

# p exp_v1(2,3)
# p exp_v1(2,4)

def exp_v2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1

    if exponent.even? 
        square_root_ans = exp_v2(base, exponent / 2)
        return square_root_ans * square_root_ans
    else
        # x = square_root_ans_over_base
        x = exp_v2(base, (exponent - 1) / 2)
        return x * x * base
    end
end

# p exp_v2(2,3)
# p exp_v2(2,6)






