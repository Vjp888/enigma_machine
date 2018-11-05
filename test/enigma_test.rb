require_relative './test_helper'

class EnigmaTest < MiniTest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_enigma_can_encrypt_message
    enigma = Enigma.new
    enigma.encrypt("hello", "12345", "251218")

    assert_equal "wfugc", enigma.encrypt[:encryption]
    assert_equal "12345", enigma.encrypt[:key]
    assert_equal "251218", enigma.encrypt[:date]
  end
end
