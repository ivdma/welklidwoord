require 'spec_helper'

describe Welklidwoord do
  describe '::parse' do
    it 'accepts one argument (a word)' do
      expect(described_class).to respond_to(:parse).with(1).argument
    end

    it 'calls parser' do
      expect(Welklidwoord::Parser).to receive(:new).once
    end
  end
end
