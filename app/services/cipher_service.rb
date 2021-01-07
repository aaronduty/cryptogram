
class CipherService
  attr_reader :cipher

  def initialize(cipher=nil)
    @cipher = cipher
    @cipher = ("A".."Z").to_a.zip(("A".."Z").to_a.shuffle).to_h if cipher.nil?
  end

  def encode(quote)
    raise "Quote is empty or not a string." if quote.class != "String" && quote.empty?
    cryptogram = quote.upcase.split("").map {|character|  character.blank? ? character : @cipher[character] }.join()
  end
end
