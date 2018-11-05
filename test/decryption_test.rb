require_relative './test_helper'

class DecryptionTest < MiniTest::Test

  def test_it_exists
    decrypt = Decryption.new("Message", "12345", "251218")

    assert_instance_of Decryption, decrypt
  end

  def test_it_can_create_rotation_groups
    decrypt = Decryption.new("Message", "12345", "251218")
    offset = [12,23,34,45]

    assert_equal offset, decrypt.create_rotation_gourps
    assert_equal 4, decrypt.create_rotation_gourps.length
  end

end
