require 'time'
class Encryption
  attr_reader :key, :date
  def initialize(message, key = rand(1..99999).to_s, date = Time.now)
    @message = message
    @key = check_key(key)
    @date = check_date(date)
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

  def create_encryption_key
    create_rotation_gourps.zip(create_offsets).map do |key|
      key.sum
    end
  end

  def encrypt
    encrypted_message = []
    char_map = ("a".."z").to_a << " "
    encrypt_key = create_encryption_key
    key_pos = 0
    @message.downcase.split(//).map do |letter|
      if key_pos <=3
        char_num = char_map.find_index("#{letter}")
        encrypt_letter = char_map.rotate(encrypt_key[key_pos])[char_num]
        encrypted_message << encrypt_letter
        key_pos += 1
      else
        key_pos = 0
        char_num = char_map.find_index("#{letter}")
        encrypt_letter = char_map.rotate(encrypt_key[key_pos])[char_num]
        encrypted_message << encrypt_letter
        key_pos += 1
      end
    end
    {encryption: encrypted_message.join, key: @key, date: @date}
  end

end
