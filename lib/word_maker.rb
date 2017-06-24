require 'net/http'

class WordMaker

  def uri(length)
    URI('http://setgetgo.com/randomword/get.php?len=' + length.to_s)
  end

  def get_word(length)
    uri = URI('http://setgetgo.com/randomword/get.php?len=' + length.to_s)
    Net::HTTP.get(uri).downcase
  end

end
