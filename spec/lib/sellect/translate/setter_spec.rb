require 'spec_helper'

describe Sellect::Translate::Setter do

  describe '.register' do

    let(:dummy_class) { build_class("Dummy") }
    let!(:dummy) { dummy_class.create(name: 'test') }

    context 'current locale matches default locale' do

      before do
        I18n.locale = :en
        I18n.default_locale = :en
      end

      it 'writes the default entry from the column' do
        expect(dummy.name).to eq('test')
      end

    end

    context 'current locale does not match default_locale' do 

      before do
        I18n.locale = :fr
        I18n.default_locale = :en
      end

      after do
        I18n.locale = :en
      end

      it 'finds or creates a new translation in the translation table' do
        expect(dummy.name).to eq('test --missing translate')
        dummy.update_attributes( name: 'test_fr' )
        expect(dummy.name).to eq('test_fr')
      end

    end
  end

end
