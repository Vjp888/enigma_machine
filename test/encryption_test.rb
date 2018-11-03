require_relative './test_helper'

class EncryptionTest < MiniTest::Test

  def test_it_exists
    encrypt = Encryption.new("Encrypt Me", 12345, Time.now)

    assert_instance_of Encryption, encrypt
  end
end
