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

  def test_it_can_create_rotation_group_offsets
    decrypt = Decryption.new("Message", "12345", "251218")
    offset = [3, 5, 2, 4]

    assert_equal offset, decrypt.create_offsets
    assert_equal 4, decrypt.create_offsets.length
  end

  def test_it_can_merge_offsets_into_rotation_groups
    decrypt = Decryption.new("Message", "12345", "251218")
    complete_offset = [15, 28, 36, 49]

    assert_equal complete_offset, decrypt.crypto_key
  end

  def test_it_can_decrypt_a_coded_message
    decrypt = Decryption.new("wfugc", "12345", "251218")

    assert_equal "hello", decrypt.decrypt[:decryption]
    assert_equal "12345", decrypt.decrypt[:key]
    assert_equal "251218", decrypt.decrypt[:date]
  end

  def test_key_can_be_padded_if_short
    decrypt = Decryption.new("Encrypt Me", "123", "251218")

    assert_equal "00123", decrypt.key
  end

  def test_time_will_be_generated_if_blank
    # I added this time object with a specific date to make sure the 'check_time'
    #method works with a time.now statement without worring about the date changing
    decrypt = Decryption.new("hello", "12345", Time.new(2018, 11, 03))

    assert_instance_of Decryption, decrypt
    assert_equal "110318", decrypt.date
  end


end
