require 'spec_helper'

describe Sellect::Translate do

  describe '.locale' do
    it 'returns the I18n locale' do
      expect(Sellect::Translate.locale).to eq(I18n.locale)
    end
  end

  describe '.default_locale' do
    it 'returns the I18n default locale' do
      expect(Sellect::Translate.default_locale).to eq(I18n.default_locale)
    end
  end

  describe 'ClassMethods' do

    describe '.translate_fields' do

      let(:dummy_class) { build_class("Dummy") }
      let(:dummy)       { dummy_class.new }

      it 'registers `translated_fields` which returns an array of translated fields' do
        expect(dummy.translated_fields).to eq([:name, :description])
      end

      it 'registers a getter' do
        expect(Sellect::Translate::Getter).to receive(:register).with(anything(), :name)
        expect(Sellect::Translate::Getter).to receive(:register).with(anything(), :description)
        dummy_class
      end

      it 'registers a setter' do
        expect(Sellect::Translate::Setter).to receive(:register).with(anything(), :name)
        expect(Sellect::Translate::Setter).to receive(:register).with(anything(), :description)
        dummy_class
      end

    end

  end

end
