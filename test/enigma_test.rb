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

  def test_it_can_decrypt_a_coded_message
    enigma = Enigma.new
    decrypt = enigma.decrypt("wfugc", "12345", "251218")

    assert_equal "hello", decrypt[:decryption]
    assert_equal "12345", decrypt[:key]
    assert_equal "251218", decrypt[:date]
  end

  def test_it_can_encrypt_without_date_and_key
    enigma = Enigma.new
    encrypt = enigma.encrypt("hello")

    assert String, encrypt[:encryption]
    assert String, encrypt[:key]
    assert String, encrypt[:date]
    assert_equal 5, encrypt[:encryption].length
    assert_equal 5, encrypt[:key].length
    assert_equal 6, encrypt[:date].length
  end

  def test_it_can_decrypt_without_date
    enigma = Enigma.new
    decrypt = enigma.decrypt("wfugc", "12345")

    assert String, decrypt[:decryption]
    assert String, decrypt[:key]
    assert String, decrypt[:date]
    assert_equal 5, decrypt[:decryption].length
    assert_equal 5, decrypt[:key].length
    assert_equal 6, decrypt[:date].length
  end
end
