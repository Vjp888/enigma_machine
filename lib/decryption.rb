require 'time'

class Decryption
  attr_reader :date, :key
  def initialize(ciphertext, key, date = Time.now)
    @ciphertext = ciphertext
    @key = check_key(key)
    @date = check_date(date)
    @char_map = ("a".."z").to_a << " "
  end

  def check_date(date)
    if date.class == Time
      date.strftime("%m%d%y")
    else
      date
    end
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

  def decryption_key
    create_rotation_gourps.zip(create_offsets).map do |key|
      key.sum
    end
  end

  def decrypt
    decrypted_message = []
    key_pos = 0
    @ciphertext.downcase.split(//).map do |letter|
      char_num = @char_map.rotate(decryption_key[key_pos]).find_index("#{letter}")
      decrypt_letter = @char_map[char_num]
      decrypted_message << decrypt_letter
      key_pos += 1
      if key_pos == 4
        key_pos = 0
      end
    end
    {decryption: decrypted_message.join, key: @key, date: @date}
  end
end
