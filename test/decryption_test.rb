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

    assert_equal complete_offset, decrypt.decryption_key
  end

  def test_it_can_decrypt_a_coded_message
    def test_it_can_encrypt_message
      decrypt = Decryption.new("wfugc", "12345", "251218")

      assert_equal "hello", decrypt.decrypt[:decryption]
      assert_equal "12345", decrypt.decrypt[:key]
      assert_equal "251218", decrypt.decrypt[:date]
    end




end
