# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  sum = 0
  arr.each do |total|
    sum += total
  return 0
  end
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.length == 0
    return 0
  elsif arr.length > 1
    arr.sort!
    return arr[arr.length-1] + arr[arr.length-2]
  else
    return arr[0]
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.length <= 1
    return false
  else
    for i in 1..(arr.length-1)
      for j in 0..(arr.length-1)
          if arr[i] + arr[j] == n
            return true
          end
      end
    end
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  puts "hello #{name}"
end

def starts_with_consonant? s
  # YOUR CODE HERE
  s.downcase
  if s ==/^[aeiou]/
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  is = s.to_i
  if s == "0"
    return true
  elsif /[a-zA-Z^$3-9*]/.match(s)
    return false
  else
    if /^[10]*00$/.match(s) && is % 2 == 0
      return true
    else
      return false
    end
  end
end

# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(isbn,price)
    @isbn  = isbn
    @price = price
    if @isbn == "" || @price <= 0 
      raise ArgumentError
    end
  end
  attr_accessor : isbn
  attr_accessor : price
  def price_as_string
    newprice = "$#{'%.2f' % , @price.round(2)}"
    return  newprice
  end
end
