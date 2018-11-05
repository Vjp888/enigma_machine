require 'time'

class Decryption

  include Cryptography

  attr_reader :date, :key
  def initialize(ciphertext, key = rand(1..99999), date = Time.now)
    @ciphertext = ciphertext
    @key = check_key(key)
    @date = check_date(date)
    @char_map = ("a".."z").to_a << " "
  end

  # def char_num(letter)
  #   @char_map.find_index("#{letter}")
  # end
  #
  # def key_rotation(position)
  #   @char_map.rotate(crypto_key[position])
  # end

  def decrypt
    decrypted = @ciphertext.downcase.split(//).map.with_index do |letter, index|
      (key_rotation((index%4))[char_num(letter)])
      char_index = key_rotation(index%4).find_index("#{letter}")
      @char_map[char_index]
    end
    {decryption: decrypted.join, key: @key, date: @date}
  end
end
