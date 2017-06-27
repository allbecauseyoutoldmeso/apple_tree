require 'net/http'
require 'json'

class WordMaker

  attr_accessor :word, :definition

  def initialize
    get_valid_word
  end

  def get_valid_word
    @word = get_word
    get_definition_response = get_definition(word)
    get_definition_response.is_a?(Net::HTTPSuccess) ? @definition = JSON.parse(get_definition_response.body)['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['definitions'][0] : get_valid_word
  end

  def get_word
    uri = URI('http://setgetgo.com/randomword/get.php?len=6')
    Net::HTTP.get(uri).downcase
  end

  def get_definition(word)
    uri = URI.parse('https://od-api.oxforddictionaries.com:443/api/v1/entries/en/' + word)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    request['app_id'] = '1999668e'
    request['app_key'] = '193c4f346db04dbe4f2bf28efd7ee8b2'
    http.request(request)
  end

end
