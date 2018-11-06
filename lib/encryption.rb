require 'time'
class Encryption

  include Cryptography

  attr_reader :key, :date
  def initialize(message, key, date)
    @message = message
    @key = check_key(key)
    @date = check_date(date)
    @char_map = ("a".."z").to_a << " "
  end

  def char_num(letter)
    @char_map.find_index("#{letter}")
  end

  def key_rotation(position)
    @char_map.rotate(crypto_key[position])
  end

  def encrypt
    encrypted = @message.downcase.split(//).map.with_index do |letter, index|
      (key_rotation((index%4))[char_num(letter)])
    end
      {encryption: encrypted.join, key: @key, date: @date}
  end
end
