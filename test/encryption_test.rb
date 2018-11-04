require_relative './test_helper'

class EncryptionTest < MiniTest::Test

  def test_it_exists
    encrypt = Encryption.new("Encrypt Me", "12345", "251218")

    assert_instance_of Encryption, encrypt
  end

  def test_it_seperates_key_into_rotation_groups
    encrypt = Encryption.new("Encrypt Me", "12345", "251218")
    offset = [12,23,34,45]

    assert_equal offset, encrypt.create_rotation_gourps
    assert_equal 4, encrypt.create_rotation_gourps.length
  end

  def test_it_can_create_rotation_group_offsets
    encrypt = Encryption.new("Encrypt Me", "12345", "251218")
    offset = [3, 5, 2, 4]
    assert_equal offset, encrypt.create_offsets
    assert_equal 4, encrypt.create_offsets.length
  end

  def test_it_can_merge_offsets_into_rotation_groups
    encrypt = Encryption.new("Encrypt Me", "12345", "251218")
    complete_offset = [15, 28, 36, 49]

    assert_equal complete_offset, encrypt.create_encryption_key
  end

  def test_key_can_be_padded_if_short
    encrypt = Encryption.new("Encrypt Me", "123", "251218")

    assert_equal "00123", encrypt.key
  end

  def test_time_will_be_generated_if_blank
    # I added this time object with a specific date to make sure the 'check_time'
    #method works with a time.now statement without worring about the date changing
    encrypt = Encryption.new("Encrypt Me", "12345", Time.new(2018, 11, 03))

    assert_instance_of Encryption, encrypt
    assert_equal "110318", encrypt.date
  end


end
