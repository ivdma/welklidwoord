require 'net/http'
require 'json'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/to_param'

require 'welklidwoord/parser'
require 'welklidwoord/version'

module Welklidwoord
  def self.parse(word, api_key = ENV['WELKLIDWOORD_API_KEY'])
    parser = Welklidwoord::Parser.new(word)
    parser.article
  end
end
