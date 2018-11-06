require_relative '../lib/decryption'
require_relative '../lib/enigma'
require 'pry'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

intake = handle.read

decrypt = enigma.decrypt(intake, ARGV[2], ARGV[3])

decrypted_file = File.open(ARGV[1], "w")

decrypted_file.write("#{decrypt[:decryption]}")

decrypted_file.close

handle.close

puts "Created 'decrypted.txt' with the key #{decrypt[:key]} and date #{decrypt[:date]}"
