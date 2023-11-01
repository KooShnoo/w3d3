# Warmup

def range(start, end_range)
  return [] if end_range < start
  return [start] if start == end_range
  return [start] if start == end_range - 1


  range(1, end_range - 1 ) << end_range - 1
end

p range(4, 1) == []
p range(1, 1) == [1]
p range(1, 2) == [1]
p range(2, 2) == [2]
p range(2, 3) == [2]
p range(1, 3) == [1, 2]
p range(1, 4) == [1, 2, 3]
p range(1, 5) == [1, 2, 3, 4]


# start = 1
# end_range = 5
# range(1, 5) == ??
# range(1, end_range - 1 ) == [1, 2, 3]
# range(1, end_range - 1 ) << end_range -1
# [1, 2, 3] << end_range -1
# [1, 2, 3] << 4
# [1, 2, 3, 4]
