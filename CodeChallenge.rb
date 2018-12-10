#You have to create a function that takes a positive integer number and returns the next bigger number formed by the same digits:

def next_bigger(n)
  #your code here
  arr = n.to_s.split("")
  if arr.length == 2
    arr = arr.sort.reverse
    return arr.join.to_i
  elsif arr.length == 3
    arr[-2], arr[-1] = arr[-1], arr[-2]
    if arr.join.to_i != n
      return arr.join.to_i
    else
      arr = arr.sort.reverse
      arr[-2], arr[-1] = arr[-1], arr[-2]
      return arr.join.to_i
    end
  elsif arr.length == 4
    arr[-2], arr[-1] = arr[-1], arr[-2]
    return arr.join.to_i
  else
    (arr.length-1).downto(0) do |x|
      arr[x-1], arr[x] = arr[x], arr[x-1]
      return arr.join.to_i if arr.join.to_i > n
    end
  end
end
