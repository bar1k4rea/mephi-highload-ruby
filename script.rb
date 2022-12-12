# frozen_string_literal: true


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
  print("Input seed: ")
  seed = gets.to_i
  print("Input array size: ")
  size = gets.to_i

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
def merge_sort_array(flag)

end


# Sorting by merging a linked list
def merge_sort_linked_list(flag)

end


# Multiplication of matrices of size N*N
def mult_matrix(flag)

end


# Search for prime numbers
def find_prime_num(flag)

end


# Read/write speed
def read_and_write_file(flag)

end


# Array and generator processing functions
def timing_arr_func(flag)

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
  find_prime_num(flag)
when "5.1"
  read_and_write_file(flag)
when "6.1"
  timing_arr_func(flag)
else
  # puts "Error in the program id!"
end

