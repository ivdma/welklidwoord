require 'open-uri'
require 'nokogiri'

require 'welklidwoord/version'

module Welklidwoord
  ARTICLES = ["het", "de"]

  class Parse
    URL   = 'https://www.welklidwoord.nl'
    XPATH = '//*[@id="content"]/h1/span'

    attr_accessor :word
    attr_accessor :article

    def initialize(word)
      @word = word
    end

    def perform
      doc.xpath(XPATH).text.to_s.downcase.strip
    end

    private

    def doc
      @doc ||= Nokogiri::HTML(open("#{URL}/#{@word}"))
    end
  end

  # returns article as a `Symbol`: `:het`, `:de`
  # returns `nil` if article is unknown
  def self.article(word)
    value = Welklidwoord::Parse.new(word).perform
    ARTICLES.include?(value) ? value.to_sym : nil
  end
end
