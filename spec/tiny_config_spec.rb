require 'spec_helper'

describe TinyConfig do
  it 'should have a version number' do
    expect(TinyConfig::VERSION).not_to be_nil
  end

  context 'hoge' do
    before { TinyConfig.register(:twitter, [:access_key]) }

    it 'should register' do
      expect(TinyConfig.twitter).not_to raise_error
      expect(TinyConfig.twitter.access_key).not_to raise_error
    end
  end
end
