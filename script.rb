# frozen_string_literal: true

require 'matrix'

class Time
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end


# Linear congruential generator.
def lcg(flag)
  print("Input seed: ")
  seed = gets.to_i
  print("Input number of values: ")
  num = gets.to_i

  m = 2_147_483_648
  a = 1_103_515_245
  c = 12_345
  i = 0

  my_array = Array.new(num)

  start_time = Time.now

  while i < num
    my_array[i] = (a * seed + c) % m
    seed = my_array[i]
    i += 1
  end

  end_time = Time.now
  print "time: " + (end_time.to_ms - start_time.to_ms).to_s + "ms\n"

  if flag == "1"
    puts my_array
  end
end




# Finding the maximum in the array
def find_max(flag)
  print("Input array size: ")
  size = gets.to_i
  print("Input seed: ")
  seed = gets.to_i

  max = 0
  i = 0
  srand seed
  my_array = Array.new(size) { rand 1_073_741_824 }

  start_time = Time.now

  while i < size
    if max < my_array[i]
      max = my_array[i]
    end
    i += 1
  end

  end_time = Time.now
  print "time: " + (end_time.to_ms - start_time.to_ms).to_s + "ms\n"

  if flag == "1"
    puts max
  end
end




# Sorting by merging an array
def merge_sort(unsorted_array)
  if unsorted_array.length <=1
    unsorted_array
  else
    mid = unsorted_array.length/2
    first_half = merge_sort(unsorted_array.slice(0...mid))
    second_half = merge_sort(unsorted_array.slice(mid...unsorted_array.length))
    merge(first_half, second_half)
  end
end
def merge(left_array, right_array)
  sorted_array = []
  while !left_array.empty? && !right_array.empty? do
    if left_array[0] < right_array[0]
      sorted_array.push(left_array.shift)
    else
      sorted_array.push(right_array.shift)
    end
  end
  sorted_array.concat(left_array).concat(right_array)
end
def merge_sort_array(flag)
  print("Input array size: ")
  size = gets.to_i
  print("Input seed: ")
  seed = gets.to_i

  srand seed
  my_array = Array.new(size) { rand 1_073_741_824 }

  start_time = Time.now

  my_array = merge_sort(my_array)

  end_time = Time.now

  print "time: " + (end_time.to_ms - start_time.to_ms).to_s + "ms\n"

  if flag == "1"
    puts my_array
  end

end




# Sorting by merging a linked list
class Node
  attr_accessor :data, :next
  def initialize(value)
    @data = value
    @next = nil
  end
end
def mergesort(head)
  return head if !head || !head.next

  a, b = front_back_split(head)
  a = mergesort(a)
  b = mergesort(b)
  sort_merge(a, b)
end
def front_back_split(head)
  slow = head
  fast = head.next
  until fast.nil?
    fast = fast.next
    unless fast.nil?
      slow = slow.next
      fast = fast.next
    end
  end
  a = head
  b = slow.next
  slow.next = nil
  [a, b]
end
def sort_merge(a, b)
  result = nil

  if a.nil?
    return b
  elsif b.nil?
    return a
  end

  if a.data <= b.data
    result = a
    result.next = sort_merge(a.next, b)
  else
    result = b
    result.next = sort_merge(a, b.next)
  end
  result
end
def merge_sort_linked_list(flag)

end





# Multiplication of matrices of size N*N
def mult_matrix(flag)
  print("Input array size: ")
  size = gets.to_i
  print("Input seed: ")
  seed = gets.to_i

  srand seed
  a = Matrix.build(size) { rand 100 }
  b = Matrix.build(size) { rand 100 }

  start_time = Time.now

  c = a * b

  end_time = Time.now

  print "time: " + (end_time.to_ms - start_time.to_ms).to_s + "ms\n"

  if flag == "1"
    (0..size).each { |i|
      (0..size).each { |j|
        print(c[i, j])
        print(" ")
      }
      print("\n")
    }
  end

end


def find_prime_numbers(flag)
  a = gets.to_i
  b = gets.to_i

  if b < 60184
    size = 6076
  elsif a < 5393
    size = b/(Math.log(b) - 1.1)
  else
    size = b/(Math.log(b) - 1.1) - a/(Math.log(a) - 1)
  end

  counter = 0
  array = Array.new(size.to_i)

  start_time = Time.now

  (a..b - 1).each do |n|
    if isPrime(n)
      array[counter] = n
      counter += 1
    end
  end

  end_time = Time.now

  print "time: " + (end_time.to_ms - start_time.to_ms).to_s + "ms\n"

  if flag == "1"
    (0..counter - 1).each do |i|
      print("#{array[i]} ")
    end
  end

end


def isPrime(n)
  if n <= 1
    return false
  end
  (2..Math.sqrt(n).to_i).each do |i|
    if n % i == 0
      return false
    end
  end
  true
end


# Read/write speed
def read_and_write_file(flag)

end



print "Input program id: "
id = gets.chomp
printf "Input program flag: "
flag = gets.chomp

case id
when "0"
  lcg(flag)
when "1.1"
  find_max(flag)
when "1.2"
  merge_sort_array(flag)
when "2.1"
  merge_sort_linked_list(flag)
when "3.1"
  mult_matrix(flag)
when "4.1"
  find_prime_numbers(flag)
when "5.1"
  read_and_write_file(flag)
else
  # puts "Error in the program id!"
end

