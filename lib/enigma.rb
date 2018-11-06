require_relative '../lib/encryption'
require_relative '../lib/decryption'
class Enigma

  def encrypt(message, key = rand(1..99999).to_s, date = Time.now)
    encrypt = Encryption.new(message, key, date)
    encrypt.encrypt
  end

  def decrypt(ciphertext, key, date = Time.now)
    decrypt = Decryption.new(ciphertext, key, date)
    decrypt.decrypt
  end
end
