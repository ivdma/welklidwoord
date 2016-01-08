module Welklidwoord
  class ApiError < StandardError; end

  class Parser
    attr_accessor :word
    attr_accessor :api_key

    def initialize(word, api_key = nil)
      @word    = word
      @api_key = api_key
    end

    def api_version
      '1.0'
    end

    def api_key
      @api_key ||= ENV['WELKLIDWOORD_API_KEY']
      @api_key ||= File.exists?(config_file) ? File.read(config_file).strip : nil
      @api_key
    end

    def article
      request
    end

    private

    def host
      "http://api.#{api_version}.welklidwoord.nl/words/"
    end

    def params
      { search: word, key: api_key }.to_param
    end

    def url
      [host, params].join('?')
    end

    def request
      response = Net::HTTP.get(URI(url))
      begin
        JSON.parse(response)
      rescue JSON::ParserError
        case response.strip
        when /null/
          fail Welklidwoord::ApiError, 'Dit woord bestaat niet, of komt niet voor in onze database.'
        when /Geen geldige key/
          fail Welklidwoord::ApiError, response.gsub('"', '').strip
        else
          fail Welklidwoord::ApiError, 'Iets ging mis'
        end
      end
    end

    def config_file
      File.expand_path("~/.welklidwoord")
    end
  end
end
