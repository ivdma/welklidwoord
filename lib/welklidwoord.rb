require 'net/http'
require 'json'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/to_param'

require 'welklidwoord/version'

module Welklidwoord
  class Parse
    URL   = 'http://welklidwoord.nl'
    XPATH = '//*[@id="content"]/h1/span'

    attr_accessor :word
    attr_accessor :article

    def initialize(word)
      @word = word
    end

    def perform
      doc.xpath(XPATH).text
    end

    private

    def doc
      @doc ||= Nokogiri::HTML(open("#{URL}/#{@word}"))
    end
  end

  def self.is_het?(word)
    Welklidwoord::Parse.new(word).perform
  end
end
