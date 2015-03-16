require 'spec_helper'

describe Sellect::Translate::Getter do

  describe '.register' do

    let(:dummy_class) { build_class("Dummy") }
    let!(:dummy) { dummy_class.create(name: 'test') }

    context 'current locale matches default locale' do

      before do
        I18n.locale = :en
        I18n.default_locale = :en
      end

      it 'returns the default entry from the column' do
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

      context 'translation exists' do

        it 'returns the translated entry from the translation table' do
          dummy.update_attributes( name: 'test_fr' )
          expect(dummy.name).to eq('test_fr')
          expect(dummy.read_attribute(:name)).to eq('test')
        end

      end

      context 'translation does not exist but column is present' do

        it 'returns --missing translate' do
          expect(dummy.name).to eq('test --missing translate')
        end

      end

      context 'translation does not exist but column is not present' do

        it 'returns --missing translate' do
          expect(dummy.description).to eq(' --missing translate')
        end

        context 'Environment is Rails production' do 

          it 'returns an empty string' do 
            Rails.env = "production"
            expect(dummy.description).to eq('')
            Rails.env = "test"
          end

        end

      end

    end

  end

end
