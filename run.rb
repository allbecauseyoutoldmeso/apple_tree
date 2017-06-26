require 'net/http'
require 'uri'
require 'openssl'

uri = URI.parse('https://od-api.oxforddictionaries.com:443/api/v1/entries/en/ace')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)
request['Accept'] = 'application/json'
request['app_id'] = '1999668e'
request['app_key'] = '193c4f346db04dbe4f2bf28efd7ee8b2'
# request.basic_auth 'Accept', 'application/json'
# request.basic_auth 'app_id', '1999668e'
# request.basic_auth 'app_key', '193c4f346db04dbe4f2bf28efd7ee8b2'

response = http.request(request)

puts response.body
