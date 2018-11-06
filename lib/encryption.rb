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

  def check_key(key)
    until key.length == 5
      key.insert(0, '0')
    end
    key
  end

  def create_rotation_gourps
    split = @key.split(//)
    [(split[0] + split[1]).to_i, (split[1] + split[2]).to_i,
    (split[2] + split[3]).to_i, (split[3] + split[4]).to_i]
  end

  def create_offsets
    date_square = @date.to_i ** 2
    offset = (date_square % 10000).to_s.split(//)
    offset.collect{|num| num.to_i}
  end

  def encryption_key
    create_rotation_gourps.zip(create_offsets).map do |key|
      key.sum
    end
  end

  def char_num(letter)
    @char_map.find_index("#{letter}")
  end

  def key_rotation(position)
    @char_map.rotate(encryption_key[position])
  end

  def encrypt
    encrypted = @message.downcase.split(//).map.with_index do |letter, index|
      (key_rotation((index%4))[char_num(letter)])
    end
      {encryption: encrypted.join, key: @key, date: @date}
  end
end
