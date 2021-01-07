class CryptogramController < ApplicationController
  def show
    cryptogram = nil
    if cryptogram_params.key?("identifier")
      cryptogram = Cryptogram.where(identifier: cryptogram_params["identifier"]).first
    end

    if cryptogram.nil?
      quote = Quote.random
      cipher_service = CipherService.new
      cryptogram = Cryptogram.create(identifier: SecureRandom.base64(32),
        cryptogram: cipher_service.encode(quote.content),
        cipher: cipher_service.cipher)
    end

    render json: CryptogramBlueprint.render(cryptogram)
  end

  def check
    cryptogram = Cryptogram.where(identifier: check_params["identifier"]).first
    cipher_service = CipherService.new(cryptogram.cipher)

    render json: { success: (cryptogram.cryptogram === cipher_service.encode(check_params["solution"])) }
  end

private
  def cryptogram_params
    @crytograms_params ||= params.permit("identifier")
  end

  def check_params
    @check_params ||= params.permit("identifier", "solution")
  end
end
