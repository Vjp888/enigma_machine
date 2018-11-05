class Enigma

  def encrypt(message, key, date)
    encrypt = Encryption.new(message, key, date)
    encrypt.encrypt
  end

  def decrypt(ciphertext, key, date)
    decrypt = Decryption.new(ciphertext, key, date)
    decrypt.decrypt
  end
end
