require 'time'

class Decryption
  attr_reader :date, :key
  def initialize(ciphertext, key = rand(1..99999), date = Time.now)
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

  def char_num(letter)
    @char_map.find_index("#{letter}")
  end

  def key_rotation(position)
    @char_map.rotate(decryption_key[position])
  end

  def decrypt
    decrypted = @ciphertext.downcase.split(//).map.with_index do |letter, index|
      (key_rotation((index%4))[char_num(letter)])
      char_index = key_rotation(index%4).find_index("#{letter}")
      @char_map[char_index]
    end
    {decryption: decrypted.join, key: @key, date: @date}
  end
end
