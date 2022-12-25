MODULUS = 2_147_483_648
MULTIPLIER = 1_103_515_245
INCREMENT = 12_345
DIVIDER = 2001
DECREMENT = 1000

class Time
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end


def lcg(size, seed)
  array = Array.new(size)
  (0..size - 1).each do |i|
    array[i] = (MULTIPLIER * seed + INCREMENT) % MODULUS
    seed = array[i]
  end
  array
end


def find_max(flag)
  size = gets.to_i
  seed = gets.to_i
  array = lcg(size, seed)

  start_time = Time.now
  max = array[0]
  (1..size - 1).each do |i|
    if max < array[i]
      max = array[i]
    end
  end
  end_time = Time.now

  print("time: #{end_time.to_ms - start_time.to_ms} ms\n")
  if flag == "1"
    puts max
  end
end


def merge_sort_array(flag)
  size = gets.to_i
  seed = gets.to_i
  array = lcg(size, seed)


  start_time = Time.now
  array = merge_sort(array)
  end_time = Time.now

  print("time: #{end_time.to_ms - start_time.to_ms} ms\n")
  if flag == "1"
    (0..size - 2).each { |i| print("#{array[i]} ")}
    puts array[size - 1]
  end
end

def merge_sort(unsorted_array)
  if unsorted_array.length <=1
    unsorted_array
  else
    middle = unsorted_array.length/2
    first_half = merge_sort(unsorted_array.slice(0...middle))
    second_half = merge_sort(unsorted_array.slice(middle...unsorted_array.length))
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


def merge_sort_linked_list(flag)

end


def mult_matrix(flag)
  n = gets.to_i
  seed = gets.to_i

  size = n * n
  a = lcg(size, seed)
  b = lcg(size, a[size - 1])
  c = Array.new(size)
  (0..size - 1).each do |i|
    a[i] = a[i] % DIVIDER - DECREMENT
    b[i] = b[i] % DIVIDER - DECREMENT
  end

  start_time = Time.now
  (0..n - 1).each do |i|
    (0..n - 1).each do |j|
      c[n*i + j] = 0
      (0..n - 1).each do |k|
        c[n*i + j] += a[n*i + k] * b[n*k + j]
      end
    end
  end
  end_time = Time.now

  print("time: #{end_time.to_ms - start_time.to_ms} ms\n")
  if flag == "1"
    (0..n - 1).each do |i|
      (0.. n - 2).each {|j| print("#{c[n*i + j]} ") }
      puts c[n*i + n -1]
    end
  end
end


def find_prime_number(flag)
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
  (a..b - 1).each do |number|
    if is_prime(number)
      array[counter] = number
      counter += 1
    end
  end
  end_time = Time.now

  print("time: #{end_time.to_ms - start_time.to_ms} ms\n")
  if flag == "1"
    (0..counter - 2).each { |i| print("#{array[i]} ")}
    puts array[counter - 1]
  end
end

def is_prime(n)
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


def read_and_write_file(flag)

end


id = gets.chomp
flag = gets.chomp
case id
when "1.1"
  find_max(flag)
when "1.2"
  merge_sort_array(flag)
when "2.1"
  merge_sort_linked_list(flag)
when "3.1"
  mult_matrix(flag)
when "4.1"
  find_prime_number(flag)
when "5.1"
  read_and_write_file(flag)
else
  puts "Incorrect program id!"
end