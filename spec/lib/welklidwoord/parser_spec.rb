require 'spec_helper'

describe Welklidwoord::Parser do
  let(:parser) { described_class.new 'fiets' }

  describe 'initialization' do
    it 'initializes word' do
      expect(parser).to respond_to :word
      expect(parser.word).to eq 'fiets'
    end

    it 'initializes api_key if provided' do
      parser = described_class.new('fiets', 'foo')
      expect(parser).to respond_to :api_key
      expect(parser.api_key).to eq 'foo'
    end

    it 'fails initializing if no word is provided' do
      expect { described_class.new }.to raise_error ArgumentError
    end
  end

  describe '#api_key' do
    it 'reads environment variable' do
      allow(ENV).to receive(:[]).with('WELKLIDWOORD_API_KEY').and_return('bar')
      expect(parser.api_key).to eq 'bar'
    end

    it 'reads contents of users ~/.welklidwoordrc file' do
      allow(File).to receive(:exists?).and_return(true)
      allow(File).to receive(:read).and_return 'foo'

      expect(parser.api_key).to eq 'foo'
    end

    it 'prefers ENV in favor of file config' do
      allow(File).to receive(:exists?).and_return(true)
      allow(File).to receive(:read).and_return 'foo'
      allow(ENV).to receive(:[]).with('WELKLIDWOORD_API_KEY').and_return('bar')

      expect(parser.api_key).to eq 'bar'
    end
  end

  describe '#article' do
    it 'returns the article' do

    end

    it 'fails if the word is not found' do
      expect do
        described_class.new('jibberjabber').article
      end.to raise_error 'Dit woord bestaat niet, of komt niet voor in onze database.'
    end

    it 'fails if api key is invalid' do
      expect do
        described_class.new('fiets', 'blabla').article
      end.to raise_error Welklidwoord::ApiError, 'Geen geldige key'
    end
  end
end
