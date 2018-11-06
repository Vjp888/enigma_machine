require 'time'
require './lib/cryptography'
require 'pry'
class Encryption

  include Cryptography

  attr_reader :key, :date
  def initialize(message, key, date)
    @message = message
    @key = check_key(key)
    @date = check_date(date)
    @char_map = ("a".."z").to_a << " "
  end

  def encrypt
    encrypted = @message.downcase.split(//).map.with_index do |letter, index|
      if char_num(letter) == nil
        letter
      else
      (key_rotation((index%4))[char_num(letter)])
      end
    end
      {encryption: encrypted.join, key: @key, date: @date}
  end
end
