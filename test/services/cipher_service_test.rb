require 'test_helper'

class CipherServiceTest < ActiveSupport::TestCase
  setup do
    @cipher_service = CipherService.new
    @text = "Mary had a little lamb".upcase
  end

  test "Encodes a string with the cipher" do
    encoded_text = @cipher_service.encode(@text)

    assert_not_equal(@text, encoded_text)
  end

  test "Cipher Service uses cipher when provided" do
    cryptogram = @cipher_service.encode(@text)
    local_cipher_service = CipherService.new(@cipher_service.cipher)

    assert_equal(cryptogram, local_cipher_service.encode(@text))
  end

  test "Encode should preserve spaces" do
    cryptogram = @cipher_service.encode(@text)

    assert_equal(cryptogram[4], " ")
  end
end
