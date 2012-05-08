require_relative "base"

require "net/http"
require "uri"
require "json"

module Fetchers
   class Traffic < Base
    BASE_URL = "http://www.mapquestapi.com"
    API_KEY = "Fmjtd%7Cluua2d6bl9%2Can%3Do5-hrr0d"


    def fetch
      #uri = URI.parse("#{BASE_URL}/traffic/v1/incidents?key=#{API_KEY}&callback=handleIncidentsResponse&boundingBox=39.503136,-76.887259,39.077998,-76.337942&filters=construction,incidents&inFormat=kvp&outFormat=json")
      # problem with the mapquest json output
      # jsonlint.com line 1 parse error
      # http://jsonformatter.curiousconcept.com/ validates ok


      #get some simple json to parse as a test
      uri = URI.parse("http://words.bighugelabs.com/api/2/a25f8302b56cb65123277441715b4276/spoon/json")

      response = Net::HTTP.get_response(uri)
      Net::HTTP.get_print(uri)
      
      http = Net::HTTP.new(uri.host, uri.port)
      response = http.request(Net::HTTP::Get.new(uri.request_uri))

      json = response.body
      print "\n\n"
      print json
      print "\n\n"

      parsed_json = JSON.parse(json)     
      
      # is there a shorter way to do this?
      if defined? parsed_json['noun']['syn'].each
        parsed_json['noun']['syn'].each {|word| print "#{word}\n"}
      end

      if defined? parsed_json['noun']['rel'].each
        parsed_json['noun']['rel'].each {|word| print "#{word}\n"}
      end    
 
      if defined? parsed_json['verb']['syn'].each
        parsed_json['verb']['syn'].each {|word| print "#{word}\n"}
      end

      if defined? parsed_json['verb']['rel'].each
        parsed_json['verb']['rel'].each {|word| print "#{word}\n"}
      end  

      @data = {
        code: response.code,
      }
    end
  end
end



