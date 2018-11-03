require_relative './test_helper'

class EncryptionTest < MiniTest::Test

  def test_it_exists
    encrypt = Encryption.new("Encrypt Me", 12345, Time.now)

    assert_instance_of Encryption, encrypt
  end

  def test_it_seperates_key_into_rotation_groups
    encrypt = Encryption.new("Encrypt Me", 12345, Time.now)
    offset = [12,23,34,45]

    assert_equal offset, encrypt.create_offset
  end
end
