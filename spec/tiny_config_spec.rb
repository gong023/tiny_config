require 'spec_helper'

describe TinyConfig, order: :defined do
  it 'should have a version number' do
    expect(TinyConfig::VERSION).not_to be_nil
  end

  context 'register' do
    context 'normal case' do
      context 'multiple keys' do
        subject { TinyConfig.register(:config_a, [:key1, :key2]) }
        it { is_expected.to be TinyConfig::Config_a }
      end

      context 'single key' do
        subject { TinyConfig.register(:config_b, :key1) }
        it { is_expected.to be TinyConfig::Config_b }
      end
    end
  end

  context 'accessing keys' do
    before(:context) do
      TinyConfig.register(:config_c, [:key1, :key2])
      TinyConfig.config_c.key1 = 'abcd'
    end

    context 'normal case' do
      subject { TinyConfig.config_c.key1 }
      it { is_expected.to eq 'abcd' }
    end

    context 'abnormal case' do
      it { expect { TinyConfig.config_c.key2 }.to raise_error TinyConfig::ConfigKeyNillError }
      it { expect { TinyConfig.unregistered.key }.to raise_error TinyConfig::UndefinedNamespaceError }
    end
  end

  context 'clear!' do
    it 'deletes all const' do
      TinyConfig.register(:config_d, :key)
      TinyConfig.register(:config_e, :key)
      TinyConfig.clear!
      expect { TinyConfig.config_d.key }.to raise_error TinyConfig::UndefinedNamespaceError
      expect { TinyConfig.config_e.key }.to raise_error TinyConfig::UndefinedNamespaceError
    end
  end
end
