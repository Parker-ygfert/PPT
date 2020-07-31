def serial_generator(n)
  # arr = *("a".."z")
  # arr1 = *("A".."Z")
  # arr2 = *(0..9)
  arr = [*"a".."z", *"A".."Z", *0..9]
  # arr += arr1
  # arr += arr2
  # arr -= ["i", "I", "o", 1, 0]
  # arr.sample(8).join
  serial = ""
  8.times do
    serial += arr.sample.to_s
  end
  serial
end

puts serial_generator(8)