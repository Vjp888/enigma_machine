require_relative './test_helper'

class EnigmaTest < MiniTest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_enigma_can_encrypt_message
    enigma = Enigma.new
    encrypt = enigma.encrypt("hello", "12345", "251218")

    assert_equal "wfugc", encrypt[:encryption]
    assert_equal "12345", encrypt[:key]
    assert_equal "251218", encrypt[:date]
  end
end
