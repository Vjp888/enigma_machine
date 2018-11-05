require 'time'

class Decryption
  def initialize(ciphertext, key, date)
    @ciphertext = ciphertext
    @key = key
    @date = date
  end
end
