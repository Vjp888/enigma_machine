require_relative './test_helper'

class DecryptionTest < MiniTest::Test

  def test_it_exists
    decrypt = Decryption.new("Message", "12345", "251218")

    assert_instance_of Decryption, decrypt
  end

end
