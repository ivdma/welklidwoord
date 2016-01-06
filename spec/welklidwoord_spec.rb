require 'spec_helper'

describe Welklidwoord do
  it 'has a version number' do
    expect(Welklidwoord::VERSION).not_to be nil
  end

  describe ".article" do
    subject { described_class.article(word) }

    context "when word has 'het' article" do
      let(:word) { "huis" }
      it { is_expected.to be(:het) }
    end

    context "when word has 'de' article" do
      let(:word) { "tafel" }
      it { is_expected.to be(:de) }
    end

    context "when word is unknown" do
      let(:word) { "brr" }
      it { is_expected.to be(nil) }
    end
  end
end
