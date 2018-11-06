require_relative '../lib/encryption'
require_relative '../lib/enigma'
require 'pry'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

intake = handle.read
encrypt = enigma.encrypt(intake)

encrypted_file = File.open('encrypted.txt', "w")

encrypted_file.write("#{encrypt[:encryption]}")

encrypted_file.close

handle.close

puts "Created 'encrypted.txt' with the key #{encrypt[:key]} and date #{encrypt[:date]}"
