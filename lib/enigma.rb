class Enigma

  def encrypt(message, key, date)
    encrypt = Encryption.new(message, key, date)
    encrypt.encrypt
  end
end
