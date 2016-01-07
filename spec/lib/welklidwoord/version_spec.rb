require 'spec_helper'

describe Welklidwoord do
  it 'defines a proper semver version string' do
    expect(Welklidwoord::VERSION).to match /\d+\.\d+\.\d+/
  end
end
