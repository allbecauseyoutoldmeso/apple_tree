require 'net/http'
require 'json'

class WordMaker

  def get_word(length)
    uri = URI('http://setgetgo.com/randomword/get.php?len=' + length.to_s)
    Net::HTTP.get(uri).downcase
  end

  def get_definition(word)
    uri = URI.parse('https://od-api.oxforddictionaries.com:443/api/v1/entries/en/' + word)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    request['app_id'] = '1999668e'
    request['app_key'] = '193c4f346db04dbe4f2bf28efd7ee8b2'
    response = http.request(request)
    JSON.parse(response.body)['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['definitions'][0]
  end

end
